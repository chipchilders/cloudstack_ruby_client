module CloudstackRubyClient
  module Api
    module Template
      cmd_processor :create_template,
                    :update_template,
                    :copy_template,
                    :delete_template,
                    :list_templates,
                    :update_template_permissions,
                    :list_template_permissions,
                    :extract_template,
                    :prepare_template
    end
  
    module ISO
      cmd_processor :attach_iso,
                    :detach_iso,
                    :list_isos,
                    :update_iso,
                    :delete_iso,
                    :copy_iso,
                    :update_iso_permissions,
                    :list_iso_permissions,
                    :extract_iso
    end
  
    module Registration
      cmd_processor :register_template,
                    :register_iso,
                    :register_user_keys,
                    :register_ssh_key_pair
    end
  end
end
