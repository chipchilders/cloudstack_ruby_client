module CloudstackRubyClient
  module Api
    module AffinityGroup
      cmd_processor :list_affinity_groups,
                    :list_affinity_group_types,
                    :create_affinity_group,
                    :delete_affinity_group,
                    :update_vm_affinity_group
    end
  end
end
