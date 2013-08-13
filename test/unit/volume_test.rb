require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class VolumeTest < Test::Unit::TestCase

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

  def test_attach_volume
    assert_raise(ArgumentError) do
      @client.attach_volume
    end
  end

  # ACS has a bug on this api command
  def test_upload_volume
    assert_raise(ArgumentError) do
      @client.upload_volume
    end
  end

  def test_detach_volume
    assert_raise(ArgumentError) do
      @client.detach_volume
    end
  end

  def test_create_volume
    assert_raise(ArgumentError) do
      @client.create_volume
    end
  end

  def test_delete_volume
    assert_raise(ArgumentError) do
      @client.delete_volume
    end
  end

  def test_list_volumes
    assert_equal({}, @client.list_volumes)
  end

  def test_extract_volume
    assert_raise(ArgumentError) do
      @client.extract_volume
    end
  end

  def test_migrate_volume
    assert_raise(ArgumentError) do
      @client.migrate_volume
    end
  end

  def test_resize_volume
    assert_raise(ArgumentError) do
      @client.resize_volume
    end
  end
end
