require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class AsyncjobTest < Test::Unit::TestCase

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

  def test_list_async_jobs
    assert_equal([], @client.list_async_jobs)
  end
  
  def test_query_async_job_result
    assert_raise(ArgumentError) do
      @client.query_async_job_result
    end
  end

end
