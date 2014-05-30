module CloudstackRubyClient
  module Api
    module Configuration
      cmd_processor :update_configuration,
                    :list_configurations,
                    :list_capabilities,
                    :update_hypervisor_capabilities,
                    :list_hypervisor_capabilities
    end
  
    module Event
      cmd_processor :list_events,
                    :list_event_types
    end

    module Ldap
      cmd_processor :list_ldap_configurations,
                    :add_ldap_configuration,
                    :delete_ldap_configuration
    end                    
  end
end