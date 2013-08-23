module CloudstackRubyClient
  module Api
    module Volume
      cmd_processor :attach_volume,
                    :upload_volume,
                    :detach_volume,
                    :create_volume,
                    :delete_volume,
                    :list_volumes,
                    :extract_volume,
                    :migrate_volume,
                    :resize_volume
    end
  end
end
