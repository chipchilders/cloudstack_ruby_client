require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class SystemVmTest < Test::Unit::TestCase

  def setup
    config      = YAML.load_file("test/config.yml")
    _host       = config['cloudstack']['host']
    _port       = config['cloudstack']['port']
    _admin_port = config['cloudstack']['admin_port']
    _api_key    = config['cloudstack']['api_key']
    _secret_key = config['cloudstack']['secret_key']
    @client     = CloudstackRubyClient::Client.new \
                                          "http://#{_host}:#{_port}/client/api",
                                          "#{_api_key}",
                                          "#{_secret_key}"
  end

  def teardown
    # Do nothing here!
  end

  ### System VM ###
  def test_start_system_vm
    assert_raise(ArgumentError) do
      @client.start_system_vm
    end
  end

  def test_reboot_system_vm
    assert_raise(ArgumentError) do
      @client.reboot_system_vm
    end
  end

  def test_stop_system_vm
    assert_raise(ArgumentError) do
      @client.stop_system_vm
    end
  end

  def test_destroy_system_vm
    assert_raise(ArgumentError) do
      @client.destroy_system_vm
    end
  end

  def test_list_system_vms
    assert_equal({}, @client.list_system_vms)
  end

  def test_migrate_system_vm
    assert_raise(ArgumentError) do
      @client.migrate_system_vm
    end
  end

  def test_change_service_for_system_vm
    assert_raise(ArgumentError) do
      @client.change_service_for_system_vm
    end
  end

  ### Virtual Router ###
  def test_start_router
    assert_raise(ArgumentError) do
      @client.start_router
    end
  end

  def test_reboot_router
    assert_raise(ArgumentError) do
      @client.reboot_router
    end
  end

  def test_stop_router
    assert_raise(ArgumentError) do
      @client.stop_router
    end
  end

  def test_destroy_router
    assert_raise(ArgumentError) do
      @client.destroy_router
    end
  end

  def test_change_service_for_router
    assert_raise(ArgumentError) do
      @client.change_service_for_router
    end
  end

  def test_list_routers
    assert_equal({}, @client.list_routers)
  end

  def test_list_virtual_router_elements
    assert_equal({}, @client.list_virtual_router_elements)
  end

  def test_configure_virtual_router_element
    assert_raise(ArgumentError) do
      @client.configure_virtual_router_element
    end
  end

  def test_create_virtual_router_element
    assert_raise(ArgumentError) do
      @client.create_virtual_router_element
    end
  end
end
