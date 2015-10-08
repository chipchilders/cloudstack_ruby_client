class CloudstackRubyClient::BaseClient

  def initialize(api_url, api_key, secret_key, use_ssl=nil, open_timeout=20)
    @api_url      = api_url
    @api_key      = api_key
    @secret_key   = secret_key
    @use_ssl      = use_ssl
    @open_timeout = open_timeout
  end

  def request(params)
    params[:response] = 'json'
    params[:apiKey] = @api_key

    data = params.map{ |k,v| "#{k.to_s}=#{CGI.escape(v.to_s).gsub(/\+|\ /, "%20")}" }.sort.join('&')
    signature = OpenSSL::HMAC.digest 'sha1', @secret_key, data.downcase
    signature = Base64.encode64(signature).chomp
    
    method = 'POST' if params[:userdata] and params[:userdata].size > 2048
    if method == "POST"
      params[:signature] = signature
      url = @api_url
    else
      signature = CGI.escape(signature)
      url = "#{@api_url}?#{data}&signature=#{signature}"
    end

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = @use_ssl
    http.open_timeout = @open_timeout  # fail the connection faster if can't open socket
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    if method == 'POST'
      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data(params)
    else
      request = Net::HTTP::Get.new(uri.request_uri)
    end

    http.request(request)
  end
end
