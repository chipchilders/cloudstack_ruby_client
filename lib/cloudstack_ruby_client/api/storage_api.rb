module CloudstackRubyClient
  module Api
    module StoragePool
      cmd_processor :list_storage_pools,
                    :create_storage_pool,
                    :update_storage_pool,
                    :delete_storage_pool,
                    :enable_storage_maintenance,
                    :cancel_storage_maintenance
    end
  
    module ImageStore
      cmd_processor :list_image_stores,
                    :add_image_store,
                    :delete_image_store
    end
  end
end