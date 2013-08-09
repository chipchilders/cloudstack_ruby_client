require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class AutoScaleTest < Test::Unit::TestCase

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
  
  def test_create_counter
    assert_raise(ArgumentError) do
      @client.create_counter
    end
  end

  def test_create_condition
    assert_raise(ArgumentError) do
      @client.create_condition
    end
  end

  def test_create_auto_scale_policy
    assert_raise(ArgumentError) do
      @client.create_auto_scale_policy
    end
  end

  def test_create_auto_scale_vm_profile
    assert_raise(ArgumentError) do
      @client.create_auto_scale_vm_profile
    end
  end

  def test_create_auto_scale_vm_group
    assert_raise(ArgumentError) do
      @client.create_auto_scale_vm_group
    end
  end

  def test_delete_counter
    assert_raise(ArgumentError) do
      @client.delete_counter
    end
  end

  def test_delete_condition
    assert_raise(ArgumentError) do
      @client.delete_condition
    end
  end

  def test_delete_auto_scale_policy
    assert_raise(ArgumentError) do
      @client.delete_auto_scale_policy
    end
  end

  def test_delete_auto_scale_vm_profile
    assert_raise(ArgumentError) do
      @client.delete_auto_scale_vm_profile
    end
  end

  def test_delete_auto_scale_vm_group
    assert_raise(ArgumentError) do
      @client.delete_auto_scale_vm_group
    end
  end

  def test_list_counters
    assert_equal(4, @client.list_counters['count'])
  end

  def test_list_conditions
    assert_equal({}, @client.list_conditions)
  end

  def test_list_auto_scale_policies
    assert_equal({},@client.list_auto_scale_policies)
  end

  def test_list_auto_scale_vm_profiles
    assert_equal({},@client.list_auto_scale_vm_profiles)
  end


  def test_list_auto_scale_vm_groups
    assert_equal({}, @client.list_auto_scale_vm_groups)
  end

  def test_enable_auto_scale_vm_group
    assert_raise(ArgumentError) do
      @client.enable_auto_scale_vm_group
    end
  end

  def test_disable_auto_scale_vm_group
    assert_raise(ArgumentError) do
      @client.disable_auto_scale_vm_group
    end
  end

  def test_update_auto_scale_policy
    assert_raise(ArgumentError) do
      @client.update_auto_scale_policy
    end
  end

  def test_update_auto_scale_vm_profile
    assert_raise(ArgumentError) do
      @client.update_auto_scale_vm_profile
    end
  end

  def test_update_auto_scale_vm_group
    assert_raise(ArgumentError) do
      @client.update_auto_scale_vm_group
    end
  end
end
