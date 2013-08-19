# require 'rubygems'
# require 'base64'
# require 'openssl'
# require 'uri'
# require 'cgi'
# require 'net/http'
# require 'json'

class CloudstackRubyClient::BaseClient

  def initialize(api_url, api_key, secret_key, use_ssl=nil)
    @api_url    = api_url
    @api_key    = api_key
    @secret_key = secret_key
    @use_ssl    = use_ssl
  end

  def request(params)
    params['response'] = 'json'
    params['apiKey'] = @api_key

    params_arr = []
    params.each do |elem|
      params_arr << elem[0].to_s + '=' + CGI.escape(elem[1].to_s)\
                                            .gsub('+', '%20').gsub(' ','%20')
    end

    data = params_arr.sort.join '&'

    signature = OpenSSL::HMAC.digest 'sha1', @secret_key, data.downcase
    signature = Base64.encode64(signature).chomp
    signature = CGI.escape(signature)

    url = "#{@api_url}?#{data}&signature=#{signature}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = @use_ssl
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    http.request(request)
  end

end
