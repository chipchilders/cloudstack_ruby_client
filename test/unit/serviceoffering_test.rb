require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class ServiceOfferingTest < Test::Unit::TestCase

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

  ### Service Offering ###
  def test_create_service_offering
    assert_raise(ArgumentError) do
      @client.create_service_offering
    end
  end

  def test_delete_service_offering
    assert_raise(ArgumentError) do
      @client.delete_service_offering
    end
  end

  def test_update_service_offering
    assert_raise(ArgumentError) do
      @client.update_service_offering
    end
  end

  def test_list_service_offerings
    assert_not_nil(@client.list_service_offerings)
  end

  ### Disk Offering ###
  def test_create_disk_offering
    assert_raise(ArgumentError) do
      @client.create_disk_offering
    end
  end

  def test_update_disk_offering
    assert_raise(ArgumentError) do
      @client.update_disk_offering
    end
  end

  def test_delete_disk_offering
    assert_raise(ArgumentError) do
      @client.delete_disk_offering
    end
  end

  def test_list_disk_offerings
    assert_not_nil(@client.list_disk_offerings)
  end
end
