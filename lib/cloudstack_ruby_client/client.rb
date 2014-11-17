require 'timeout'

class CloudstackRubyClient::RequestError < RuntimeError
  attr_reader :response, :json

  def initialize(response, json)
    @response = response
    @json = json
  end
end

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

  ## CloudStack management server version
  def version
    self.list_capabilities["capability"]["cloudstackversion"]
  end

  ## login api command
  def login(params = {})
    auth_request(params, "login")
  end


  ## logout api command
  def logout(params = {})
    auth_request(params, "logout")
  end

  def wait_for_async_job(job, timeout=nil)
    wait_time = 1
    slept_time = 0
    if job.has_key? 'jobid' then
      job_id = job['jobid']
    else
      job_id = job
    end

    return Timeout::timeout(timeout) do
      while true do
         job_stat = self.query_async_job_result(:jobid => job_id)
         if job_stat[:jobprocstatus] == 0 then  #pending
           sleep wait_time
           slept_time += wait_time
           if slept_time >= 30 then
             wait_time = 5
           elsif slept_time >= 10 then
             wait_time = 2
           end
         else
           return job_stat
         end
      end
    end
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

      raise CloudstackRubyClient::RequestError.new(response, json)
    end
    
    json[resp_title]
  end

end
