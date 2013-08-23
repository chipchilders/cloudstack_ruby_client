module CloudstackRubyClient
  module Api
    module SecurityGroup
      cmd_processor :create_security_group,
                    :delete_security_group,
                    :authorize_security_group_ingress,
                    :revoke_security_group_ingress,
                    :authorize_security_group_egress,
                    :revoke_security_group_egress,
                    :list_security_groups
    end
  end
end
