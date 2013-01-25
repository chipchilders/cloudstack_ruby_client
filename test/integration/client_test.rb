require 'test/unit'
require 'cloudstack_ruby_client'

class SampleTest < Test::Unit::TestCase

  URL = 'http://192.168.56.10:8080/client/api/'
  APIKEY = 'yy0sfCPpyKnvREhgpeIWzXORIIvyteq_iCgFpKXnqpdbnHuoYiK78nprSggG4hcx-hxwW897nU-XvGB0Tq8YFw'
  SECKEY = 'Pse4fqYNnr1xvoRXlAe8NQKCSXeK_VGdwUxUzyLEPVQ7B3cI1Q7B8jmZ42FQpz2jIICFax1foIzg2716lJFZVw'

  def test_listNetworkOfferings
    client = CloudstackRubyClient::Client.new(URL, APIKEY, SECKEY, false)
    client.listNetworkOfferings()
  end

  def test_badURL
    client = CloudstackRubyClient::Client.new('http://192.168.56.10:8081/client/api', APIKEY, SECKEY, false)
    assert_raise NoMethodError do
      client.listNetworkOfferings()
    end
  end
end
