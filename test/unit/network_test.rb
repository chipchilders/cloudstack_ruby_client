require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class NetworkTest < Test::Unit::TestCase

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

  ### Network Offering ###
  def test_create_network_offering
    assert_raise(ArgumentError) do
      @client.create_network_offering
    end
  end

  def test_update_network_offering
    assert_raise(ArgumentError) do
      @client.update_network_offering
    end
  end

  def test_delete_network_offering
    assert_raise(ArgumentError) do
      @client.delete_network_offering
    end
  end

  def test_list_network_offerings
    assert_not_nil(@client.list_network_offerings) 
  end

  ### Network ###
  def test_create_network
    assert_raise(ArgumentError) do
      @client.create_network
    end
  end

  def test_delete_network
    assert_raise(ArgumentError) do
      @client.delete_network
    end
  end

  def test_list_networks
    assert_equal({}, @client.list_networks)
  end

  def test_restart_network
    assert_raise(ArgumentError) do
      @client.restart_network
    end
  end

  def test_update_network
    assert_raise(ArgumentError) do
      @client.update_network
    end
  end

  ## Physical Network ###
  def test_create_physical_network
    assert_raise(ArgumentError) do
      @client.create_physical_network
    end
  end

  def test_delete_physical_network
    assert_raise(ArgumentError) do
      @client.delete_physical_network
    end
  end

  def test_list_physical_networks
    assert_equal({}, @client.list_physical_networks)
  end

  def test_update_physical_network
    assert_raise(ArgumentError) do
      @client.update_physical_network
    end
  end

  ### Network Service Provider ###
  def test_list_supported_network_services
    assert_not_nil(@client.list_supported_network_services)
  end
  
  def test_add_network_service_provider
    assert_raise(ArgumentError) do
      @client.add_network_service_provider
    end
  end

  def test_delete_network_service_provider
    assert_raise(ArgumentError) do
      @client.delete_network_service_provider
    end
  end

  def test_list_network_service_providers
    assert_equal({}, @client.list_network_service_providers)
  end

  def test_update_network_service_provider
    assert_raise(ArgumentError) do
      @client.update_network_service_provider
    end
  end

  ### Storage Network IP Range ###
  def test_create_storage_network_ip_range
    assert_raise(ArgumentError) do
      @client.create_storage_network_ip_range
    end
  end

  def test_delete_storage_network_ip_range
    assert_raise(ArgumentError) do
      @client.delete_storage_network_ip_range
    end
  end

  def test_list_storage_network_ip_range
    assert_equal({}, @client.list_storage_network_ip_range)
  end

  def test_update_storage_network_ip_range
    assert_raise(ArgumentError) do
      @client.update_storage_network_ip_range
    end
  end

  ### Network Device ###
  def test_add_network_device
    assert_raise(ArgumentError) do
      @client.add_network_device
    end
  end

  def test_list_network_device
    assert_raise(ArgumentError) do
      @client.list_network_device
    end
  end

  def test_delete_network_device
    assert_raise(ArgumentError) do
      @client.delete_network_device
    end
  end

  ### Network ACL ###
  def test_create_network_acl
    assert_raise(ArgumentError) do
      @client.create_network_acl
    end
  end

  def test_delete_network_acl
    assert_raise(ArgumentError) do
      @client.delete_network_acl
    end
  end

  def test_list_network_acls
    assert_not_nil(@client.list_network_acls)
  end

  def test_list_nicira_nvp_device_networks
    assert_raise(ArgumentError) do
      @client.list_nicira_nvp_device_networks
    end
  end
end
