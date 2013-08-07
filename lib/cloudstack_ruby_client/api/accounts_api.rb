module Accounts
  module Domain
    cmd_processor :list_domains,
                  :create_domain,
                  :update_domain,
                  :delete_domain,
                  :list_domain_children
  end

  module Account
    cmd_processor :list_accounts,
                  :create_account,
                  :update_account,
                  :delete_account,
                  :disable_account,
                  :enable_account,
                  :lock_account,
                  :add_account_to_project,
                  :delete_account_from_project,
                  :list_project_accounts

  end

  module User
    cmd_processor :list_users,
                  :create_user,
                  :update_user,
                  :delete_user,
                  :lock_user,
                  :disable_user,
                  :enable_user,
                  :get_user,
                  :add_vpn_user,
                  :remove_vpn_user,
                  :list_vpn_users
  end

  module Limit
    cmd_processor :update_resource_limit,
                  :update_resource_count,
                  :list_resource_limits,
                  :get_api_limit,
                  :reset_api_limit

  end
end
