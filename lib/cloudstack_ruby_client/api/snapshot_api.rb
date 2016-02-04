module CloudstackRubyClient
  module Api
    module Snapshot
      cmd_processor :create_snapshot,
                    :list_snapshots,
                    :delete_snapshot,
                    :create_snapshot_policy,
                    # FIXME: Weird deleteSnapshotPolicies command
                    :delete_snapshot_policies,
                    :list_snapshot_policies,
                    :list_vm_snapshot,
                    :create_vm_snapshot,
                    :delete_vm_snapshot,
                    :revert_to_vm_snapshot
    end
  end
end
