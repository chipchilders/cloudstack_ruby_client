class Module

  MALFORMED_CMDS = {
    "getvmpassword"              => 'getVMPassword',
    "updatevmaffinitygroup"      => "updateVMAffinityGroup",
    "listneworkacls"             => "listNetworkACLs",
    "createneworkacl"            => "createNetworkACL",
    "deleteneworkacl"            => "deleteNetworkACL",
    "updateeneworkaclitem"       => "updateNetworkACLItem",
    "createnetworkacllist"       => "createNetworkACLList",
    "deleteNetworkacllist"       => "deleteNetworkACLList",
    "replacenetworkacllist"      => "replaceNetworkACLList",
    "listnetworkacllists"        => "listNetworkACLLists",
    "setsshkeyforvirtualmachine" => "setSSHKeyForVirtualMachine",
    "registersshkeypair"         => "registerSSHKeyPair",
    "createsshkeypair"           => "createSSHKeyPair",
    "deletesshkeypair"           => "deleteSSHKeyPair",
    "listsshkeypairs"            => "listSSHKeyPairs",
    "createlbstickinesspolicy"   => "createLBStickinessPolicy",
    "deletelbstickinesspolicy"   => "deleteLBStickinessPolicy",
    "listlbstickinesspolicies"   => "listLBStickinessPolicies",
    "listlbhealthcheckpolicies"  => "listLBHealthCheckPolicies",
    "createlbhealthcheckpolicy"  => "createLBHealthCheckPolicy",
    "deletelbhealthcheckpolicy"  => "deleteLBHealthCheckPolicy",
    "createvpc"                  => "createVPC",
    "listvpcs"          	 => "listVPCs",
    "deletevpc"          	 => "deleteVPC",
    "updatevpc"                  => "updateVPC",
    "restartvpc"                 => "restartVPC",
    "createvpcoffering"          => "createVPCOffering",
    "updatevpcoffering"          => "updateVPCOffering",
    "deletevpcoffering"          => "deleteVPCOffering",
    "listvpcofferings"           => "listVPCOfferings"
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

          command = MALFORMED_CMDS.has_key?('#{arga.join('')}') ? MALFORMED_CMDS['#{arga.join('')}'] : "#{
            arga.each_with_index.map {|x, i|
              i==0 ? x : x.capitalize
            }.join('')
          }";

          resp_title = "#{arga.join('')}response";
      } +

      #
      # The following code block is dealing with malformed response
      #

      %Q{

          MALFORMED_RESPONSES.each do |k, v|;
            if k =~ command;
              resp_title = v;
            end;
          end;

      } +

      %Q{
          params = {:command => command};
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
