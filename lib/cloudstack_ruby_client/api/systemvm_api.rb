module SystemVm
  module SystemVm
    cmd_processor :start_system_vm,
                  :reboot_system_vm,
                  :stop_system_vm,
                  :destroy_system_vm,
                  :list_system_vms,
                  :migrate_system_vm,
                  :change_service_for_system_vm
  end

  module Router
    cmd_processor :start_router,
                  :reboot_router,
                  :stop_router,
                  :destroy_router,
                  :change_service_for_router,
                  :list_routers,
                  :list_virtual_router_elements,
                  :configure_virtual_router_element,
                  :create_virtual_router_element
  end
end
