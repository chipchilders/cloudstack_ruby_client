class CloudstackRubyClient::Client < CloudstackRubyClient::BaseClient
  
  ## Infra Api commands injection
  include CloudstackRubyClient::Infrastructure::Region
  include CloudstackRubyClient::Infrastructure::Zone
  include CloudstackRubyClient::Infrastructure::Pod
  include CloudstackRubyClient::Infrastructure::Cluster
  include CloudstackRubyClient::Infrastructure::Host


  ## Accounts Api command injection
  include CloudstackRubyClient::Accounts::Domain
  include CloudstackRubyClient::Accounts::Account
  include CloudstackRubyClient::Accounts::User
  include CloudstackRubyClient::Accounts::Limit
  include CloudstackRubyClient::Accounts::Usage

  ## System VM commands injection
  include CloudstackRubyClient::VirtualMachine::VirtualMachine
  include CloudstackRubyClient::VirtualMachine::VMGroup

  ## Virtual Machine commands insjection
  include CloudstackRubyClient::SystemVm::SystemVm
  include CloudstackRubyClient::SystemVm::Router

  ## Storage commands injection
  include CloudstackRubyClient::Storage::StoragePool
  include CloudstackRubyClient::Storage::ImageStore

  ## Network commands injection
  include CloudstackRubyClient::Network::NetworkOffering
  include CloudstackRubyClient::Network::Network
  include CloudstackRubyClient::Network::PhysicalNetwork
  include CloudstackRubyClient::Network::NetworkServiceProvider
  include CloudstackRubyClient::Network::StorageIpRange
  include CloudstackRubyClient::Network::NetworkDevice
  include CloudstackRubyClient::Network::NetworkACL
  include CloudstackRubyClient::Network::Vlan
  include CloudstackRubyClient::Network::Nat
  include CloudstackRubyClient::Network::VPN
  include CloudstackRubyClient::Network::LoadBalancer
  include CloudstackRubyClient::Network::VPC

  ## Volume command injection
  include CloudstackRubyClient::Volume::Volume

  ## Templdate command injection
  include CloudstackRubyClient::Template::Template
  include CloudstackRubyClient::Template::ISO
  include CloudstackRubyClient::Template::Registration

  ## Security group command injection
  include CloudstackRubyClient::SecurityGroup::SecurityGroup

  ## Project command injection
  include CloudstackRubyClient::Project::Project

  ## Snapshot command injection
  include CloudstackRubyClient::Snapshot::Snapshot

  ## Configuraion command injection
  include CloudstackRubyClient::Configuration::Configuration
  include CloudstackRubyClient::Configuration::Event

  ## Service offering command injection
  include CloudstackRubyClient::ServiceOffering::ServiceOffering
  include CloudstackRubyClient::ServiceOffering::DiskOffering

  ## Auto scale command injection
  include CloudstackRubyClient::AutoScale::AutoScale

  ## Firewall command injection
  include CloudstackRubyClient::Firewall::Firewall

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
