require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class SnapshotTest < Test::Unit::TestCase

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

  ### Snapshot ###
  def test_create_snapshot
    assert_raise(ArgumentError) do
      @client.create_snapshot
    end
  end

  def test_list_snapshots
    assert_equal({}, @client.list_snapshots)
  end

  def test_create_snapshot_policy
    assert_raise(ArgumentError) do
      @client.create_snapshot_policy
    end
  end

  def test_delete_snapshot_policies
    assert_raise(ArgumentError) do
      @client.delete_snapshot_policies
    end
  end

  def test_list_snapshot_policies
    assert_raise(ArgumentError) do
      @client.list_snapshot_policies
    end
  end

  def test_list_vm_snapshot
    assert_raise(ArgumentError) do
      @client.list_vm_snapshot
    end
  end

  def test_create_vm_snapshot
    assert_raise(ArgumentError) do
      @client.create_vm_snapshot
    end
  end

  def test_delete_vm_snapshot
    assert_raise(ArgumentError) do
      @client.delete_vm_snapshot
    end
  end

  def test_revert_to_vm_snapshot
    assert_raise(ArgumentError) do
      @client.revert_to_vm_snapshot
    end
  end
end
