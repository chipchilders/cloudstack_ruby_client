module Infrastructure
  module Region
    cmd_processor :add_region,
                  :update_region,
                  :remove_region,
                  :list_regions
  end

  module Zone
    cmd_processor  :list_zones,
                   :create_zone,
                   :update_zone,
                   :delete_zone,
                   :dedicate_zone
  end

  module Pod
    cmd_processor :list_pods,
                  :create_pod,
                  :update_pod,
                  :delete_pod,
                  :dedicate_pod
  end

  module Cluster
    cmd_processor :list_clusters,
                  :add_cluster,
                  :update_cluster,
                  :delete_cluster,
                  :dedicate_cluster
  end
  
  module Host
    cmd_processor :list_hosts,
                  :add_host,
                  :update_host,
                  :delete_host,
                  :dedicate_host,
                  :reconnect_host
  end
end
