class CloudstackRubyClient::Client < CloudstackRubyClient::BaseClient

  @@API_LIST = []

  ## Api command injection
  CloudstackRubyClient::Api.constants.collect{|k| 
    CloudstackRubyClient::Api.const_get(k)
  }.select {|k| k.is_a?(Module)}.each do |sub_module|
    include sub_module
  
    @@API_LIST.concat sub_module.instance_methods(false)
  end

  def self.API_LIST
    @@API_LIST
  end

  ## login api command
  def login(params = {})
    auth_request(params, "login")
  end


  ## logout api command
  def logout(params = {})
    auth_request(params, "logout")
  end
  
  protected
  
  def auth_request(params, command)
    params['response'] = 'json'
    params['command']  = command
    data = params.map{ |k,v| "#{k.to_s}=#{CGI.escape(v.to_s).gsub(/\+|\ /, "%20")}" }.sort.join('&')
    
    url = "#{@api_url}?#{data}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = @use_ssl
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    resp_title = "#{command}response"; 

    response = http.request(request)
    json = JSON.parse(response.body)
    
    if !response.is_a?(Net::HTTPOK)
      if ["431","530"].include?(response.code) and ["9999","4350"].include?(json[resp_title]['cserrorcode'])
        raise ArgumentError, json[resp_title]['errortext']
      end
      
      raise RuntimeError, json['errorresponse']['errortext'] if response.code == "432"
      
      puts 'Error ' + response.code + ':'
      puts JSON.pretty_generate(json)
      exit 1
    end
    
    json[resp_title]
  end
end
