require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class StorageTest < Test::Unit::TestCase

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

  def test_list_storage_pools
    assert_equal({}, @client.list_storage_pools)
  end

  def test_create_storage_pool
    assert_raise(ArgumentError) do
      @client.create_storage_pool
    end
  end

  def test_update_storage_pool
    assert_raise(ArgumentError) do
      @client.update_storage_pool
    end
  end

  def test_delete_storage_pool
    assert_raise(ArgumentError) do
      @client.delete_storage_pool
    end
  end

  def test_enable_storage_maintenance
    assert_raise(ArgumentError) do
      @client.enable_storage_maintenance
    end
  end

  def test_cancel_storage_maintenance
    assert_raise(ArgumentError) do
      @client.cancel_storage_maintenance
    end
  end


  ### Image Store ###

  def test_list_image_stores
    assert_equal({}, @client.list_image_stores)
  end

  def add_image_store
    assert_raise(ArgumentError) do
      @client.add_image_store
    end
  end

  def delete_image_store
    assert_raise(ArgumentError) do
      @client.delete_image_store
    end
  end
end
