module CloudstackRubyClient
  module Api
    module NetworkOffering
      cmd_processor :create_network_offering,
                    :update_network_offering,
                    :delete_network_offering,
                    :list_network_offerings
    end
    
    module Network
      cmd_processor :create_network,
                    :delete_network,
                    :list_networks,
                    :restart_network,
                    :update_network
    end
  
    module PhysicalNetwork
      cmd_processor :create_physical_network,
                    :delete_physical_network,
                    :list_physical_networks,
                    :update_physical_network
    end
  
    module NetworkServiceProvider
      cmd_processor :list_supported_network_services,
                    :add_network_service_provider,
                    :delete_network_service_provider,
                    :list_network_service_providers,
                    :update_network_service_provider
    end
  
    module StorageIpRange
      cmd_processor :create_storage_network_ip_range,
                    :delete_storage_network_ip_range,
                    :list_storage_network_ip_range,
                    :update_storage_network_ip_range
    end
  
    module NetworkDevice
      cmd_processor :add_network_device,
                    :list_network_device,
                    :delete_network_device
    end
  
    module NetworkACL
      cmd_processor :create_network_acl,
                    :delete_network_acl,
                    :list_network_acls,
                    :list_nicira_nvp_device_networks
    end
  
    module Vlan
      cmd_processor :create_vlan_ip_range,
                    :delete_vlan_ip_range,
                    :list_vlan_ip_ranges
    end
  
    module Nat
      cmd_processor :enable_static_nat,
                    :create_ip_forwarding_rule,
                    :delete_ip_forwarding_rule,
                    :list_ip_forwarding_rules,
                    :disable_static_nat
    end
  
    module VPN
      cmd_processor :create_remote_access_vpn,
                    :delete_remote_access_vpn,
                    :list_remote_access_vpns,
                    :create_vpn_customer_gateway,
                    :create_vpn_gateway,
                    :create_vpn_connection,
                    :delete_vpn_customer_gateway,
                    :delete_vpn_gateway,
                    :delete_vpn_connection,
                    :update_vpn_customer_gateway,
                    :reset_vpn_connection,
                    :list_vpn_customer_gateways,
                    :list_vpn_gateways,
                    :list_vpn_connections
    end
  
    module LoadBalancer
      cmd_processor :create_load_balancer_rule,
                    :delete_load_balancer_rule,
                    :remove_from_load_balancer_rule,
                    :assign_to_load_balancer_rule,
                    :create_lb_stickiness_policy,
                    :delete_lb_stickiness_policy,
                    :list_load_balancer_rules,
                    :list_lb_Stickiness_policies,
                    :list_load_balancer_rule_instances,
                    :update_load_balancer_rule
    end
  
    module VPC
      cmd_processor :create_vpc,
                    :list_vpcs,
                    :delete_vpc,
                    :update_vpc,
                    :restart_vpc,
                    :create_vpc_offering,
                    :update_vpc_offering,
                    :delete_vpc_offering,
                    :list_vpc_offerings,
                    :create_private_gateway,
                    :list_private_gateways,
                    :delete_private_gateway,
                    :create_static_route,
                    :delete_static_route,
                    :list_static_routes
    end
  end
end
