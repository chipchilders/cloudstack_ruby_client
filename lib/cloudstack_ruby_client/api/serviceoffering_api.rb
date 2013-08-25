module CloudstackRubyClient
  module Api
    module ServiceOffering
      cmd_processor :create_service_offering,
                    :delete_service_offering,
                    :update_service_offering,
                    :list_service_offerings
    end
  
    module DiskOffering
      cmd_processor :create_disk_offering,
                    :update_disk_offering,
                    :delete_disk_offering,
                    :list_disk_offerings
    end
  end
end