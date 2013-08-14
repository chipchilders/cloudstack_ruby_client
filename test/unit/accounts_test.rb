require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class AccountsTest < Test::Unit::TestCase

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

  ### Domain Testing ###

  def test_list_domains
    # expect_result = JSON.parse(
    #   '{"count":1 ,' + 
    #    '"domain":[' +
    #       '{"id":"f45c793a-ff0d-11e2-b492-00256494eb2f",' +
    #        '"name":"ROOT",'+
    #        '"level":0,' +
    #        '"haschild":false,' +
    #        '"path":"ROOT"}' +
    #     ']' +
    #   '}')
    # assert_equal(expect_result, @client.list_regions)
    
    assert_equal(1, @client.list_domains['count'])
    assert_equal('ROOT', @client.list_domains['domain'][0]['name'])
  end

  def test_create_domain
    assert_raise(ArgumentError) do
      @client.create_domain
    end
  end

  def test_update_domain
    assert_raise(ArgumentError) do
      @client.update_domain
    end
  end

  def test_delete_domain
    assert_raise(ArgumentError) do
      @client.delete_domain
    end
  end

  def test_list_domain_children
    assert_equal({}, @client.list_domain_children)
  end

  ### Account Testing ###
  
  def test_list_accounts
    assert_equal(1, @client.list_accounts['count'])
    assert_equal('admin', @client.list_accounts['account'][0]['name'])
  end

  def test_create_account
    assert_raise(ArgumentError) do
      @client.create_account
    end
  end

  def test_update_account
    assert_raise(ArgumentError) do
      @client.update_account
    end
  end

  def test_delete_account
    assert_raise(ArgumentError) do
      @client.delete_account

    end
  end

  def test_disable_account
    assert_raise(ArgumentError) do
      @client.disable_account
    end
  end

  def test_enable_account
    # NOTE: The cserror code is 4350 for enable_account
    assert_raise(ArgumentError) do
      @client.enable_account
    end
  end

  def test_lock_account
    assert_raise(ArgumentError) do
      @client.lock_account
    end
  end

  def test_add_account_to_project
    assert_raise(ArgumentError) do
      @client.add_account_to_project
    end
  end

  def test_delete_account_from_project
    assert_raise(ArgumentError) do
      @client.delete_account_from_project
    end
  end

  def test_list_project_accounts
    assert_raise(ArgumentError) do
      @client.list_project_accounts
    end
  end

  ### User Testing ###

  def test_list_users
    assert_equal(1, @client.list_users['count'])
    assert_equal('admin', @client.list_users['user'][0]['username'])
  end

  def test_create_user
    assert_raise(ArgumentError) do
      @client.create_user
    end
  end

  def test_update_user
    assert_raise(ArgumentError) do
      @client.update_user
    end
  end

  def test_delete_user
    assert_raise(ArgumentError) do
      @client.delete_user
    end
  end

  def test_lock_user
    assert_raise(ArgumentError) do
      @client.lock_user
    end
  end

  def test_disable_user
    assert_raise(ArgumentError) do
      @client.disable_user
    end
  end


  def test_enable_user
    assert_raise(ArgumentError) do
      @client.enable_user
    end
  end

  def test_get_user
    assert_raise(ArgumentError) do
      @client.get_user
    end
  end

  def test_add_vpn_user
    assert_raise(ArgumentError) do
      @client.add_vpn_user
    end
  end

  def test_remove_vpn_user
    assert_raise(ArgumentError) do
      @client.remove_vpn_user
    end
  end

  def test_list_vpn_users
    assert_equal({}, @client.list_vpn_users)
  end

  ### Limit Test ###

  def test_update_resource_limit
    assert_raise(ArgumentError) do
      @client.update_resource_limit
    end
  end

  def test_update_resource_count
    assert_raise(ArgumentError) do
      @client.update_resource_count
    end
  end

  def test_list_resource_limits
    assert_equal('admin', 
                 @client.list_resource_limits['resourcelimit'][0]['account'])
  end

  def test_get_api_limit
    assert_raise(RuntimeError) do
      @client.get_api_limit
    end
  end

  def test_reset_api_limit
    assert_raise(RuntimeError) do
      @client.reset_api_limit
    end
  end
  
  ### Usage Testing ###

  def test_add_traffic_type
    assert_raise(ArgumentError) do
      @client.add_traffic_type
    end
  end

  def test_delete_traffic_type
    assert_raise(ArgumentError) do
      @client.delete_traffic_type
    end
  end

  def test_list_traffic_types
    assert_raise(ArgumentError) do
      @client.list_traffic_types
    end
  end

  def test_update_traffic_type
    assert_raise(ArgumentError) do
      @client.update_traffic_type
    end
  end

  def test_list_traffic_type_implementors
    assert_equal(12, @client.list_traffic_type_implementors['count'])
  end

  def test_generate_usage_records
    assert_raise(ArgumentError) do
      @client.generate_usage_records
    end
  end

  def test_list_usage_records
    assert_raise(ArgumentError) do
      @client.list_usage_records
    end
  end

  def test_add_traffic_monitor
    assert_raise(ArgumentError) do
      @client.add_traffic_monitor
    end
  end

  def test_delete_traffic_monitor
    assert_raise(ArgumentError) do
      @client.delete_traffic_monitor
    end
  end

  def test_list_traffic_monitors
    assert_raise(ArgumentError) do
      @client.list_traffic_monitors
    end
  end
end
