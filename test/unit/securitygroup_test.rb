require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class SecurityGroupTest < Test::Unit::TestCase

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

  ### Security Group ###
  def test_create_security_group
    assert_raise(ArgumentError) do
      @client.create_security_group
    end
  end
  
  def test_delete_securiy_group
    assert_raise(ArgumentError) do
      @client.delete_security_group
    end
  end

  def test_authorize_security_group_ingress
    assert_raise(ArgumentError) do
      @client.authorize_security_group_ingress
    end
  end

  def test_revoke_security_group_ingress
    assert_raise(ArgumentError) do
      @client.revoke_security_group_ingress
    end
  end

  def test_authorize_security_group_egress
    assert_raise(ArgumentError) do
      @client.authorize_security_group_egress
    end
  end

  def test_revoke_security_group_egress
    assert_raise(ArgumentError) do
      @client.revoke_security_group_egress
    end
  end

  def test_list_security_groups
    assert_not_nil(@client.list_security_groups)
  end
end
