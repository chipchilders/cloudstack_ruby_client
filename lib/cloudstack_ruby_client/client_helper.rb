class Module

  MALFORMED_CMDS = {
    /getvmpassword/i            => 'getVMPassword'
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
    /restorevirtualmachine/i        => 'restorevmresponse'
  }

  def cmd_processor(*args)
    args.each do |arg|
      arga = arg.to_s.split('_')
      meta_method = %Q{
        def #{arga[0]+"_"+arga[1]}#{('_'+arga[2]) unless arga[2].nil?}#{('_'+arga[3]) unless arga[3].nil?}#{('_'+arga[4]) unless arga[4].nil?}#{('_'+arga[5]) unless arga[5].nil?}#{('_'+arga[6]) unless arga[6].nil?}(args={});

          command = "#{arga[0]}#{arga[1].capitalize}#{arga[2].capitalize unless arga[2].nil?}#{arga[3].capitalize unless arga[3].nil?}#{arga[4].capitalize unless arga[4].nil?}#{arga[5].capitalize unless arga[5].nil?}#{arga[6].capitalize unless arga[6].nil?}";

          resp_title = "#{arga[0]}#{arga[1]}#{arga[2] unless arga[2].nil?}#{arga[3] unless arga[3].nil?}#{arga[4] unless arga[4].nil?}#{arga[5] unless arga[5].nil?}#{arga[6] unless arga[6].nil?}response";
      } +

      #
      # The following code block is dealing with malformed api commands
      #

      %Q{
          MALFORMED_RESPONSES.each do |k, v|;
            if k =~ command; 
              resp_title = v;
            end;
          end;

          MALFORMED_CMDS.each do |k, v|;
            if k =~ command;
              command = v;
            end
          end;

          if /(list|create|delete)networkacl.*/i =~ command;
            command.gsub! /acl/i, 'ACL';
          end;

          if /.*(ssh).*/i =~ command;
            command.gsub! /ssh/i, 'SSH';
          end;

          if /(list|create|delete)lbstickinesspolic.*/i =~ command;
            command.gsub! /lb/i, 'LB';
          end;

          if /.*vpc.*/i =~ command;
            command.gsub! /vpc/i, 'VPC';
          end;
      } + 
      %Q{
          params = {'command' => command};
          params.merge! args unless args.empty?;

          response = request params;

          if !response.is_a?(Net::HTTPOK);
            if response.code == "431" &&
               (JSON.parse(response.body)[resp_title]['cserrorcode'] == 9999 ||
                JSON.parse(response.body)[resp_title]['cserrorcode'] == 4350);

               raise ArgumentError, JSON.parse(response.body)\
                                                      [resp_title]['errortext'];

            end;

            if response.code == "432";
              raise RuntimeError, JSON.parse(response.body)\
                                                 ['errorresponse']['errortext'];

            end;

            puts 'Error ' + response.code + ':'
            puts JSON.pretty_generate(JSON.parse(response.body));
            exit 1;
          end;
                                                                 
          json = JSON.parse(response.body);
          json[resp_title]
        end;
      }
      
      self.class_eval meta_method
    end
  end
end
