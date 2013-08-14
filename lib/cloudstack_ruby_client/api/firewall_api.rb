module CloudstackRubyClient
  module Firewall
    module Firewall
      cmd_processor :list_port_forwarding_rules,
                    :create_port_forwarding_rule,
                    :delete_port_forwarding_rule,
                    :update_port_forwarding_rule,
                    :create_firewall_rule,
                    :delete_firewall_rule,
                    :list_firewall_rules,
                    :create_egress_firewall_rule,
                    :delete_egress_firewall_rule,
                    :list_egress_firewall_rules
    end
  end
end
