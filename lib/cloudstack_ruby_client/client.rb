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
    params['response'] = 'json'
    params['command']  = 'login'
    params_arr = []
    params.each do |elem|
      params_arr << elem[0].to_s + '=' + CGI.escape(elem[1].to_s)\
                                            .gsub('+', '%20').gsub(' ','%20')
    end

    data = params_arr.sort.join '&'

    url = "#{@api_url}?#{data}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = @use_ssl
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    resp_title = "loginresponse"; 

    response = http.request(request)

    if !response.is_a?(Net::HTTPOK);
      if response.code =~ /(431|530)/ &&
         (JSON.parse(response.body)[resp_title]['cserrorcode'] == 9999 ||
          JSON.parse(response.body)[resp_title]['cserrorcode'] == 4350);

         raise ArgumentError, JSON.parse(response.body)\
                                                [resp_title]['errortext'];

      end;

      raise RuntimeError, JSON.parse(response.body)\
                                           ['errorresponse']['errortext'];
    end;
                                                           
    json = JSON.parse(response.body);

    json[resp_title]
  end


  ## logout api command
  def logout(params = {})
    params['response'] = 'json'
    params['command']  = 'logout'
    params_arr = []
    params.each do |elem|
      params_arr << elem[0].to_s + '=' + CGI.escape(elem[1].to_s)\
                                            .gsub('+', '%20').gsub(' ','%20')
    end

    data = params_arr.sort.join '&'

    url = "#{@api_url}?#{data}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = @use_ssl
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    resp_title = "logoutresponse"

    response = http.request(request)

    if !response.is_a?(Net::HTTPOK);
      if response.code =~ /(431|530)/ &&
         (JSON.parse(response.body)[resp_title]['cserrorcode'] == 9999 ||
          JSON.parse(response.body)[resp_title]['cserrorcode'] == 4350);

         raise ArgumentError, JSON.parse(response.body)\
                                                [resp_title]['errortext'];

      end;

      raise RuntimeError, JSON.parse(response.body)\
                                           ['errorresponse']['errortext'];
    end;

    json = JSON.parse(response.body);

    json[resp_title]
  end
end
