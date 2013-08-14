require 'test/unit'
require 'yaml'
require_relative '../../lib/cloudstack_ruby_client'

class TemplateTest < Test::Unit::TestCase

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

  ### Template ###
  def test_create_template
    assert_raise(ArgumentError) do
      @client.create_template
    end
  end

  def test_update_template
    assert_raise(ArgumentError) do
      @client.update_template
    end
  end

  def test_copy_template
    assert_raise(ArgumentError) do
      @client.copy_template
    end
  end

  def test_delete_template
    assert_raise(ArgumentError) do
      @client.delete_template
    end
  end

  def test_list_templates
    assert_raise(ArgumentError) do
      @client.list_templates
    end
  end

  def test_update_template_permissions
    assert_raise(ArgumentError) do
      @client.update_template_permissions
    end
  end

  def test_list_template_permissions
    assert_raise(ArgumentError) do
      @client.list_template_permissions
    end
  end

  def test_extract_template
    assert_raise(ArgumentError) do
      @client.extract_template
    end
  end

  def test_prepare_template
    assert_raise(ArgumentError) do
      @client.prepare_template
    end
  end

  ### ISO ###
  def test_attach_iso
    assert_raise(ArgumentError) do
      @client.attach_iso
    end
  end

  def test_detach_iso
    assert_raise(ArgumentError) do
      @client.detach_iso
    end
  end

  def test_list_isos
    assert_not_nil(@client.list_isos)
  end

  def test_update_iso
    assert_raise(ArgumentError) do
      @client.update_iso
    end
  end

  def test_delete_iso
    assert_raise(ArgumentError) do
      @client.delete_iso
    end
  end

  def test_copy_iso
    assert_raise(ArgumentError) do
      @client.copy_iso
    end
  end

  def test_update_iso_permissions
    assert_raise(ArgumentError) do
      @client.update_iso_permissions
    end
  end

  def test_list_iso_permissions
    assert_raise(ArgumentError) do
      @client.list_iso_permissions
    end
  end

  def test_extract_iso
    assert_raise(ArgumentError) do
      @client.extract_iso
    end
  end

  ### Registration ###
  def test_register_template
    assert_raise(ArgumentError) do
      @client.register_template
    end
  end

  def test_register_iso
    assert_raise(ArgumentError) do
      @client.register_iso
    end
  end

  def test_register_user_keys
    assert_raise(ArgumentError) do
      @client.register_user_keys
    end
  end

  def test_register_ssh_key_pair
  end
end
