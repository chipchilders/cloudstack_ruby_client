require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class EmptyTest < Test::Unit::TestCase

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


  ### Zone Test ####

  def test_list_zones
    @client.list_zones
  end

  def test_create_zone
    @client.create_zone
  end

  def test_update_zone
    @client.update_zone
  end

  def test_delete_zone
    @client.delete_zone
  end

  def test_dedicate_zone
    @client.dedicate_zone
  end

  ### Pod Test ###

  def test_list_pods
    @client.list_pods
  end

  def test_create_pod
    @client.create_pod
  end

  def test_update_pod
    @client.update_pod
  end

  def test_delete_pod
    @client.delete_pod
  end

  ### Cluster Test ###

  def test_list_clusters
    @client.list_clusters
  end

  def test_add_cluster
    @client.add_cluster
  end

  def test_update_cluster
    @client.update_cluster
  end

  def test_delete_cluster
    @client.delete_cluster
  end

  def test_dedicate_cluster
    @client.dedicate_cluster
  end

  ### Host Test ###
  
  def test_list_hosts
    @client.list_hosts
  end

  def test_add_host
    @client.add_host
  end

  def test_update_host
    @client.udpate_host
  end

  def test_delete_host
    @client.delete_host
  end

  def test_reconnect_host
    @client.reconnect_host
  end

  def test_dedicate_host
    @client.dedicate_host
  end
end
