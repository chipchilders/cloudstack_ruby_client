require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class InfrastructureTest < Test::Unit::TestCase

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

  ### Region Test ###
  def test_list_regions
    # expect_result = JSON.parse('{ "count":1,"region":[{"id":1,"name":"Local","endpoint":"http://localhost:8080/client/"}]}')
    # assert_equal(expect_result, @client.list_regions)
    assert_equal(1, @client.list_regions['count'])
    assert_equal('Local', @client.list_regions['region'][0]['name'])
  end

  def test_add_region
    assert_raise(ArgumentError) do
      @client.add_region
    end
  end

  def test_update_region
    assert_raise(ArgumentError) do
      @client.update_region
    end
  end

  def test_remove_region
    assert_raise(ArgumentError) do
      @client.remove_region
    end
  end

  ### Zone Test ###

  def test_list_zones
    assert_equal({},@client.list_zones)
  end

  def test_create_zone
    assert_raise(ArgumentError) do
      @client.create_zone
    end
  end

  def test_update_zone
    assert_raise(ArgumentError) do
      @client.update_zone
    end
  end

  def test_delete_zone
    assert_raise(ArgumentError) do
      @client.delete_zone
    end
  end

  def test_dedicate_zone
    assert_raise(ArgumentError) do
      @client.dedicate_zone
    end
  end

  ### Pod Test ###

  def test_list_pods
    assert_equal({},@client.list_pods)
  end

  def test_create_pod
    assert_raise(ArgumentError) do
      @client.create_pod
    end
  end

  def test_update_pod
    assert_raise(ArgumentError) do
      @client.update_pod
    end
  end

  def test_delete_pod
    assert_raise(ArgumentError) do
      @client.delete_pod
    end
  end

  ### Cluster Test ###

  def test_list_clusters
    assert_equal({},@client.list_clusters)
  end

  def test_add_cluster
    assert_raise(ArgumentError) do
      @client.add_cluster
    end
  end

  def test_update_cluster
    assert_raise(ArgumentError) do
      @client.update_cluster
    end
  end

  def test_delete_cluster
    assert_raise(ArgumentError) do
      @client.delete_cluster
    end
  end

  def test_dedicate_cluster
    assert_raise(ArgumentError) do
      @client.dedicate_cluster
    end
  end

  ### Host Test ###
  
  def test_list_hosts
    assert_equal({}, @client.list_hosts)
  end

  def test_add_host
    assert_raise(ArgumentError) do
      @client.add_host
    end
  end

  def test_update_host
    assert_raise(ArgumentError) do
      @client.update_host
    end
  end

  def test_delete_host
    assert_raise(ArgumentError) do
      @client.delete_host
    end
  end

  def test_reconnect_host
    assert_raise(ArgumentError) do
      @client.reconnect_host
    end
  end

  def test_dedicate_host
    assert_raise(ArgumentError) do
      @client.dedicate_host
    end
  end
end
