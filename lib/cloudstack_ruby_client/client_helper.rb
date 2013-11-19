class Module

  MALFORMED_CMDS = {
    "getvmpassword"         => 'getVMPassword',
    "updatevmaffinitygroup" => "updateVMAffinityGroup"
  }

  #
  # The following is malformed response title in ACS, should be fixed
  #
  MALFORMED_RESPONSES = {
    /(create|list)counter/i         => 'counterresponse',
    /createcondition/i              => 'conditionresponse',
    /createautoscalepolicy/i        => 'autoscalepolicyresponse',
    /createautoscalevmprofile/i     => 'autoscalevmprofileresponse',
    /createautoscalevmgroup/i       => 'autoscalevmgroupresponse',
    /enableautoscalevmgroup/i       => 'enableautoscalevmGroupresponse',
    /disableautoscalevmgroup/i      => 'disableautoscalevmGroupresponse',
    /assignvirtualmachine/i         => 'moveuservmresponse',
    /resetsshkeyforvirtualmachine/i => 'resetSSHKeyforvirtualmachineresponse',
    /restorevirtualmachine/i        => 'restorevmresponse',
    /activateproject/i              => 'activaterojectresponse',
    /listnetworkdevice/i            => 'listnetworkdevice',
    /listniciranvpdevicenetworks/i  => 'listniciranvpdevicenetworks',
    /listniciranvpdevices/i         => 'listniciranvpdeviceresponse',
    /cancelstoragemaintenance/i     => 'cancelprimarystoragemaintenanceresponse',
    /enablestoragemaintenance/i     => 'prepareprimarystorageformaintenanceresponse',
    /copyiso/i                      => 'copytemplateresponse',
    /deleteiso/i                    => 'deleteisosresponse',
    /listisopermissions/i           => 'listtemplatepermissionsresponse',
    /addiptonic/i                   => 'addiptovmnicresponse',
    /updatevmaffinitygroup/i        => 'updatevirtualmachineresponse'
  }

  def cmd_processor(*args)
    args.each do |arg|
      arga = arg.to_s.split('_')
      meta_method = %Q{
        def #{arg}(args={});

          command = "#{
            arga.each_with_index.map {|x, i|
              i==0 ? x : x.capitalize
            }.join('')
          }"

          resp_title = "#{arga.join('')}response"
      } +

      #
      # The following code block is dealing with malformed api commands
      #

      %Q{
          MALFORMED_RESPONSES.each do |k, v|
            if k =~ command
              resp_title = v
            end
          end

          if MALFORMED_CMDS.has_key?(command.downcase);
            command = MALFORMED_CMDS[command.downcase];
          end;

          if /(list|create|delete)networkacl.*/i =~ command
            command.gsub!(/acl/i, 'ACL')
          end

          if /.*(ssh).*/i =~ command
            command.gsub!(/ssh/i, 'SSH')
          end

          if /(list|create|delete)lbstickinesspolic.*/i =~ command
            command.gsub!(/lb/i, 'LB')
          end

          if /.*vpc.*/i =~ command
            command.gsub!(/vpc/i, 'VPC')
          end
      } +
      %Q{
          params = {'command' => command};
          params.merge!(args) unless args.empty?;

          response = request(params);
          json = JSON.parse(response.body);

          if !response.is_a?(Net::HTTPOK)
            if ["431","530"].include?(response.code) and
               ["9999","4350"].include?(json[resp_title]['cserrorcode'].to_s);

              raise ArgumentError, json[resp_title]['errortext'];
            end;

            raise RuntimeError, json['errorresponse']['errortext'] if response.code.to_s == "432"

            raise CloudstackRubyClient::RequestError.new(response, json)
          end

          json[resp_title]
        end
      }

      self.class_eval(meta_method)
    end
  end
end
