module CloudstackRubyClient
  module Api
    module AutoScale
      cmd_processor :create_counter,
                    :create_condition,
                    :create_auto_scale_policy,
                    :create_auto_scale_vm_profile,
                    :create_auto_scale_vm_group,
                    :delete_counter,
                    :delete_condition,
                    :delete_auto_scale_policy,
                    :delete_auto_scale_vm_profile,
                    :delete_auto_scale_vm_group,
                    :list_counters,
                    :list_conditions,
                    :list_auto_scale_policies,
                    :list_auto_scale_vm_profiles,
                    :list_auto_scale_vm_groups,
                    :enable_auto_scale_vm_group,
                    :disable_auto_scale_vm_group,
                    :update_auto_scale_policy,
                    :update_auto_scale_vm_profile,
                    :update_auto_scale_vm_group
    end
  end
end