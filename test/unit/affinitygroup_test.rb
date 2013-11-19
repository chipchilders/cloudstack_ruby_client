require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class AffinityGroupTest < Test::Unit::TestCase
  def setup
    config      = YAML.load_file("test/config.yml")
    _host       = config['cloudstack']['host']
    _port       = config['cloudstack']['port']
    _admin_port = config['cloudstack']['admin_port']
    _api_key    = config['cloudstack']['api_key']
    _secret_key = config['cloudstack']['secret_key']
    @client     = CloudstackRubyClient::Client.new\
                                          "http://#{_host}:#{_port}/client/api",
                                          "#{_api_key}",
                                          "#{_secret_key}"
  end

  def teardown
    # Do nothing here!
  end

  def test_list_affinity_groups
    @client.list_affinity_groups
  end

  def test_list_affinity_group_types
    @client.list_affinity_group_types
  end

  def test_create_affinity_group
    assert_raise(ArgumentError) do
      @client.create_affinity_group
    end
  end

  def test_update_vm_affinity_group
    assert_raise(ArgumentError) do
      @client.update_vm_affinity_group
    end
  end

  def test_delete_affinity_group
    @client.delete_affinity_group
  end
end
