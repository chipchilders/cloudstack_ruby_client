module CloudstackRubyClient
  module Api
    module VirtualMachine
      cmd_processor :deploy_virtual_machine,
                    :destroy_virtual_machine,
                    :reboot_virtual_machine,
                    :start_virtual_machine,
                    :stop_virtual_machine,
                    :reset_password_for_virtual_machine,
                    :reset_ssh_key_for_virtual_machine,
                    :update_virtual_machine,
                    :list_virtual_machines,
                    :get_vm_password,
                    :restore_virtual_machine,
                    :change_service_for_virtual_machine,
                    :assign_virtual_machine,
                    :migrate_virtual_machine,
                    :recover_virtual_machine,
                    :add_nic_to_virtual_machine,
                    :remove_nic_from_virtual_machine,
                    :update_default_nic_for_virtual_machine
    end
    
    module VMGroup
      cmd_processor :create_instance_group,
                    :delete_instance_group,
                    :update_instance_group,
                    :list_instance_groups
    end
  end
end
