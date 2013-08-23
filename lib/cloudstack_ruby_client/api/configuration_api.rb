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
  end
end
