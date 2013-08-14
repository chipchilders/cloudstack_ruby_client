require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class ProjectTest < Test::Unit::TestCase

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

  def test_create_project
    assert_raise(ArgumentError) do
      @client.create_project
    end
  end

  def test_delete_project
    assert_raise(ArgumentError) do
      @client.delete_project
    end
  end

  def test_update_project
    assert_raise(ArgumentError) do
      @client.update_project
    end
  end

  def test_activate_project
    assert_raise(ArgumentError) do
      @client.activate_project
    end
  end

  def test_suspend_project
    assert_raise(ArgumentError) do
      @client.suspend_project
    end
  end

  def test_list_projects
    assert_equal({}, @client.list_projects)
  end

  def test_list_project_invitations
    assert_equal({}, @client.list_project_invitations)
  end

  def test_update_project_invitation
    assert_raise(ArgumentError) do
      @client.update_project_invitation
    end
  end

  def test_delete_project_invitation
    assert_raise(ArgumentError) do
      @client.delete_project_invitation
    end
  end
end
