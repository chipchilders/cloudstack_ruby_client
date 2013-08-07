require_relative "client_helper"
require_relative "api/config"

class CloudstackRubyClient::Client < CloudstackRubyClient::BaseClient
  
  ## Infra Api commands injection
  include Infrastructure::Region
  include Infrastructure::Zone
  include Infrastructure::Pod
  include Infrastructure::Cluster
  include Infrastructure::Host


  ## Accounts Api command injection
  include Accounts::Domain
  include Accounts::Account
  include Accounts::User
  include Accounts::Limit

  ## System VM commands injection
  include VirtualMachine::VirtualMachine
  include VirtualMachine::VMGroup

  ## Virtual Machine commands insjection
  include SystemVm::SystemVm
  include SystemVm::Router

  ## Storage commands injection
  include Storage::StoragePool
  include Storage::ImageStore

  ## Network commands injection
  include Network::NetworkOffering
  include Network::Network
  include Network::PhysicalNetwork
  include Network::NetworkServiceProvider
  include Network::StorageIpRange
  include Network::NetworkDevice
  include Network::NetworkACL
  include Network::Vlan
  include Network::Nat
  include Network::VPN
  include Network::LoadBalancer

  ## Volume command injection
  include Volume::Volume

  ## Templdate command injection
  include Template::Template
  include Template::ISO
  include Template::Registration

  ## Security group command injection
  include SecurityGroup::SecurityGroup

  ## Project command injection
  include Project::Project

  ## Snapshot command injection
  include Snapshot::Snapshot

  ## Configuraion command injection
  include Configuration::Configuration
  include Configuration::Event

  ## Service offering command injection
  include ServiceOffering::ServiceOffering
  include ServiceOffering::DiskOffering


  def createNetworkOffering(args={})
      # Creates a network offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the network offering
      #     guestiptype - guest type of the network offering: Shared or Isolated
      #     name - the name of the network offering
      #     supportedservices - services supported by the network offering
      #     traffictype - the traffic type for the network offering. Supported type in c
      #       urrent release is GUEST only
      #     availability - the availability of network offering. Default value is Option
      #       al
      #     conservemode - true if the network offering is IP conserve mode enabled
      #     networkrate - data transfer rate in megabits per second allowed
      #     servicecapabilitylist - desired service capabilities as part of network offe
      #       ring
      #     serviceofferingid - the service offering ID used by virtual router provider
      #     serviceproviderlist - provider to service mapping. If not specified, the pro
      #       vider for the service will be mapped to the default provider on the physical net
      #       work
      #     specifyipranges - true if network offering supports specifying ip ranges; de
      #       faulted to false if not specified
      #     specifyvlan - true if network offering supports vlans
      #     tags - the tags for the network offering.

      args.merge!('command' => 'createNetworkOffering')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('guestiptype')
          raise ArgumentError, "Missing required argument 'guestiptype'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('supportedservices')
          raise ArgumentError, "Missing required argument 'supportedservices'"
      end
      if not args.has_key?('traffictype')
          raise ArgumentError, "Missing required argument 'traffictype'"
      end

      return request(args)
  end
 

  def updateNetworkOffering(args={})
      # Updates a network offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     availability - the availability of network offering. Default value is Requir
      #       ed for Guest Virtual network offering; Optional for Guest Direct network offerin
      #       g
      #     displaytext - the display text of the network offering
      #     id - the id of the network offering
      #     name - the name of the network offering
      #     sortkey - sort key of the network offering, integer
      #     state - update state for the network offering

      args.merge!('command' => 'updateNetworkOffering')

      return request(args)
  end
 

  def deleteNetworkOffering(args={})
      # Deletes a network offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the network offering

      args.merge!('command' => 'deleteNetworkOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listNetworkOfferings(args={})
      # Lists all available network offerings.
      # 
      # args - A dictionary. The following are options for keys:
      #     availability - the availability of network offering. Default value is Requir
      #       ed
      #     displaytext - list network offerings by display text
      #     forvpc - the network offering can be used only for network creation inside t
      #       he VPC
      #     guestiptype - list network offerings by guest type: Shared or Isolated
      #     id - list network offerings by id
      #     isdefault - true if need to list only default network offerings. Default val
      #       ue is false
      #     istagged - true if offering has tags specified
      #     keyword - List by keyword
      #     name - list network offerings by name
      #     networkid - the ID of the network. Pass this in if you want to see the avail
      #       able network offering that a network can be changed to.
      #     page - 
      #     pagesize - 
      #     sourcenatsupported - true if need to list only netwok offerings where source
      #        nat is supported, false otherwise
      #     specifyipranges - true if need to list only network offerings which support 
      #       specifying ip ranges
      #     specifyvlan - the tags for the network offering.
      #     state - list network offerings by state
      #     supportedservices - list network offerings supporting certain services
      #     tags - list network offerings by tags
      #     traffictype - list by traffic type
      #     zoneid - list netowrk offerings available for network creation in specific z
      #       one
      #     page - Pagination

      args.merge!('command' => 'listNetworkOfferings')

      return request(args)
  end
 

  def createNetwork(args={})
      # Creates a network
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the network
      #     name - the name of the network
      #     networkofferingid - the network offering id
      #     zoneid - the Zone ID for the network
      #     account - account who will own the network
      #     acltype - Access control type; supported values are account and domain. In 3
      #       .0 all shared networks should have aclType=Domain, and all Isolated networks - A
      #       ccount. Account means that only the account owner can use the network, domain - 
      #       all accouns in the domain can use the network
      #     domainid - domain ID of the account owning a network
      #     endip - the ending IP address in the network IP range. If not specified, wil
      #       l be defaulted to startIP
      #     gateway - the gateway of the network. Required for Shared networks and Isola
      #       ted networks when it belongs to VPC
      #     netmask - the netmask of the network. Required for Shared networks and Isola
      #       ted networks when it belongs to VPC
      #     networkdomain - network domain
      #     physicalnetworkid - the Physical Network ID the network belongs to
      #     projectid - an optional project for the ssh key
      #     startip - the beginning IP address in the network IP range
      #     subdomainaccess - Defines whether to allow subdomains to use networks dedica
      #       ted to their parent domain(s). Should be used with aclType=Domain, defaulted to 
      #       allow.subdomain.network.access global config if not specified
      #     vlan - the ID or VID of the network
      #     vpcid - the VPC network belongs to

      args.merge!('command' => 'createNetwork')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('networkofferingid')
          raise ArgumentError, "Missing required argument 'networkofferingid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def deleteNetwork(args={})
      # Deletes a network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the network

      args.merge!('command' => 'deleteNetwork')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listNetworks(args={})
      # Lists all available networks.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     acltype - list networks by ACL (access control list) type. Supported values 
      #       are Account and Domain
      #     canusefordeploy - list networks available for vm deployment
      #     domainid - list only resources belonging to the domain specified
      #     forvpc - the network belongs to vpc
      #     id - list networks by id
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     issystem - true if network is system, false otherwise
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     physicalnetworkid - list networks by physical network id
      #     projectid - list objects by project
      #     restartrequired - list networks by restartRequired
      #     specifyipranges - true if need to list only networks which support specifyin
      #       g ip ranges
      #     supportedservices - list networks supporting certain services
      #     tags - List resources by tags (key/value pairs)
      #     traffictype - type of the traffic
      #     type - the type of the network. Supported values are: Isolated and Shared
      #     vpcid - List networks by VPC
      #     zoneid - the Zone ID of the network
      #     page - Pagination

      args.merge!('command' => 'listNetworks')

      return request(args)
  end
 

  def restartNetwork(args={})
      # Restarts the network; includes 1) restarting network elements - virtual routers,
      #  dhcp servers 2) reapplying all public ips 3) reapplying loadBalancing/portForwa
      # rding rules
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The id of the network to restart.
      #     cleanup - If cleanup old network elements

      args.merge!('command' => 'restartNetwork')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateNetwork(args={})
      # Updates a network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the network
      #     changecidr - Force update even if cidr type is different
      #     displaytext - the new display text for the network
      #     name - the new name for the network
      #     networkdomain - network domain
      #     networkofferingid - network offering ID

      args.merge!('command' => 'updateNetwork')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createPhysicalNetwork(args={})
      # Creates a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name of the physical network
      #     zoneid - the Zone ID for the physical network
      #     broadcastdomainrange - the broadcast domain range for the physical network[P
      #       od or Zone]. In Acton release it can be Zone only in Advance zone, and Pod in Ba
      #       sic
      #     domainid - domain ID of the account owning a physical network
      #     isolationmethods - the isolation method for the physical network[VLAN/L3/GRE
      #       ]
      #     networkspeed - the speed for the physical network[1G/10G]
      #     tags - Tag the physical network
      #     vlan - the VLAN for the physical network

      args.merge!('command' => 'createPhysicalNetwork')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def deletePhysicalNetwork(args={})
      # Deletes a Physical Network.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Physical network

      args.merge!('command' => 'deletePhysicalNetwork')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listPhysicalNetworks(args={})
      # Lists physical networks
      # 
      # args - A dictionary. The following are options for keys:
      #     id - list physical network by id
      #     keyword - List by keyword
      #     name - search by name
      #     page - 
      #     pagesize - 
      #     zoneid - the Zone ID for the physical network
      #     page - Pagination

      args.merge!('command' => 'listPhysicalNetworks')

      return request(args)
  end
 

  def updatePhysicalNetwork(args={})
      # Updates a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - physical network id
      #     networkspeed - the speed for the physical network[1G/10G]
      #     state - Enabled/Disabled
      #     tags - Tag the physical network
      #     vlan - the VLAN for the physical network

      args.merge!('command' => 'updatePhysicalNetwork')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listSupportedNetworkServices(args={})
      # Lists all network services provided by CloudStack or for the given Provider.
      # 
      # args - A dictionary. The following are options for keys:
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     provider - network service provider name
      #     service - network service name to list providers and capabilities of
      #     page - Pagination

      args.merge!('command' => 'listSupportedNetworkServices')

      return request(args)
  end
 

  def addNetworkServiceProvider(args={})
      # Adds a network serviceProvider to a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name for the physical network service provider
      #     physicalnetworkid - the Physical Network ID to add the provider to
      #     destinationphysicalnetworkid - the destination Physical Network ID to bridge
      #        to
      #     servicelist - the list of services to be enabled for this physical network s
      #       ervice provider

      args.merge!('command' => 'addNetworkServiceProvider')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('physicalnetworkid')
          raise ArgumentError, "Missing required argument 'physicalnetworkid'"
      end

      return request(args)
  end
 

  def deleteNetworkServiceProvider(args={})
      # Deletes a Network Service Provider.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the network service provider

      args.merge!('command' => 'deleteNetworkServiceProvider')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listNetworkServiceProviders(args={})
      # Lists network serviceproviders for a given physical network.
      # 
      # args - A dictionary. The following are options for keys:
      #     keyword - List by keyword
      #     name - list providers by name
      #     page - 
      #     pagesize - 
      #     physicalnetworkid - the Physical Network ID
      #     state - list providers by state
      #     page - Pagination

      args.merge!('command' => 'listNetworkServiceProviders')

      return request(args)
  end
 

  def updateNetworkServiceProvider(args={})
      # Updates a network serviceProvider of a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - network service provider id
      #     servicelist - the list of services to be enabled for this physical network s
      #       ervice provider
      #     state - Enabled/Disabled/Shutdown the physical network service provider

      args.merge!('command' => 'updateNetworkServiceProvider')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createStorageNetworkIpRange(args={})
      # Creates a Storage network IP range.
      # 
      # args - A dictionary. The following are options for keys:
      #     gateway - the gateway for storage network
      #     netmask - the netmask for storage network
      #     podid - UUID of pod where the ip range belongs to
      #     startip - the beginning IP address
      #     endip - the ending IP address
      #     vlan - Optional. The vlan the ip range sits on, default to Null when it is n
      #       ot specificed which means you network is not on any Vlan. This is mainly for Vmw
      #       are as other hypervisors can directly reterive bridge from pyhsical network traf
      #       fic type table

      args.merge!('command' => 'createStorageNetworkIpRange')
      if not args.has_key?('gateway')
          raise ArgumentError, "Missing required argument 'gateway'"
      end
      if not args.has_key?('netmask')
          raise ArgumentError, "Missing required argument 'netmask'"
      end
      if not args.has_key?('podid')
          raise ArgumentError, "Missing required argument 'podid'"
      end
      if not args.has_key?('startip')
          raise ArgumentError, "Missing required argument 'startip'"
      end

      return request(args)
  end
 

  def deleteStorageNetworkIpRange(args={})
      # Deletes a storage network IP Range.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the uuid of the storage network ip range

      args.merge!('command' => 'deleteStorageNetworkIpRange')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listStorageNetworkIpRange(args={})
      # List a storage network IP range.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - optional parameter. Storaget network IP range uuid, if specicied, using
      #        it to search the range.
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     podid - optional parameter. Pod uuid, if specicied and range uuid is absent,
      #        using it to search the range.
      #     zoneid - optional parameter. Zone uuid, if specicied and both pod uuid and r
      #       ange uuid are absent, using it to search the range.
      #     page - Pagination

      args.merge!('command' => 'listStorageNetworkIpRange')

      return request(args)
  end
 

  def updateStorageNetworkIpRange(args={})
      # Update a Storage network IP range, only allowed when no IPs in this range have b
      # een allocated.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - UUID of storage network ip range
      #     endip - the ending IP address
      #     netmask - the netmask for storage network
      #     startip - the beginning IP address
      #     vlan - Optional. the vlan the ip range sits on

      args.merge!('command' => 'updateStorageNetworkIpRange')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def addNetworkDevice(args={})
      # Adds a network device of one of the following types: ExternalDhcp, ExternalFirew
      # all, ExternalLoadBalancer, PxeServer
      # 
      # args - A dictionary. The following are options for keys:
      #     networkdeviceparameterlist - parameters for network device
      #     networkdevicetype - Network device type, now supports ExternalDhcp, PxeServe
      #       r, NetscalerMPXLoadBalancer, NetscalerVPXLoadBalancer, NetscalerSDXLoadBalancer,
      #        F5BigIpLoadBalancer, JuniperSRXFirewall

      args.merge!('command' => 'addNetworkDevice')

      return request(args)
  end
 

  def listNetworkDevice(args={})
      # List network devices
      # 
      # args - A dictionary. The following are options for keys:
      #     keyword - List by keyword
      #     networkdeviceparameterlist - parameters for network device
      #     networkdevicetype - Network device type, now supports ExternalDhcp, PxeServe
      #       r, NetscalerMPXLoadBalancer, NetscalerVPXLoadBalancer, NetscalerSDXLoadBalancer,
      #        F5BigIpLoadBalancer, JuniperSRXFirewall
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listNetworkDevice')

      return request(args)
  end
 

  def deleteNetworkDevice(args={})
      # Deletes network device.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Id of network device to delete

      args.merge!('command' => 'deleteNetworkDevice')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createNetworkACL(args={})
      # Creates a ACL rule the given network (the network has to belong to VPC)
      # 
      # args - A dictionary. The following are options for keys:
      #     networkid - The network of the vm the ACL will be created for
      #     protocol - the protocol for the ACL rule. Valid values are TCP/UDP/ICMP.
      #     cidrlist - the cidr list to allow traffic from/to
      #     endport - the ending port of ACL
      #     icmpcode - error code for this icmp message
      #     icmptype - type of the icmp message being sent
      #     startport - the starting port of ACL
      #     traffictype - the traffic type for the ACL,can be Ingress or Egress, default
      #       ed to Ingress if not specified

      args.merge!('command' => 'createNetworkACL')
      if not args.has_key?('networkid')
          raise ArgumentError, "Missing required argument 'networkid'"
      end
      if not args.has_key?('protocol')
          raise ArgumentError, "Missing required argument 'protocol'"
      end

      return request(args)
  end
 

  def deleteNetworkACL(args={})
      # Deletes a Network ACL
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the network ACL

      args.merge!('command' => 'deleteNetworkACL')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listNetworkACLs(args={})
      # Lists all network ACLs
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - Lists network ACL with the specified ID.
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     networkid - list network ACLs by network Id
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     traffictype - list network ACLs by traffic type - Ingress or Egress
      #     page - Pagination

      args.merge!('command' => 'listNetworkACLs')

      return request(args)
  end
 

  def listNiciraNvpDeviceNetworks(args={})
      # lists network that are using a nicira nvp device
      # 
      # args - A dictionary. The following are options for keys:
      #     nvpdeviceid - nicira nvp device ID
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listNiciraNvpDeviceNetworks')
      if not args.has_key?('nvpdeviceid')
          raise ArgumentError, "Missing required argument 'nvpdeviceid'"
      end

      return request(args)
  end
 

  def createVPC(args={})
      # Creates a VPC
      # 
      # args - A dictionary. The following are options for keys:
      #     cidr - the cidr of the VPC. All VPC guest networks' cidrs should be within t
      #       his CIDR
      #     displaytext - the display text of the VPC
      #     name - the name of the VPC
      #     vpcofferingid - the ID of the VPC offering
      #     zoneid - the ID of the availability zone
      #     account - the account associated with the VPC. Must be used with the domainI
      #       d parameter.
      #     domainid - the domain ID associated with the VPC. If used with the account p
      #       arameter returns the VPC associated with the account for the specified domain.
      #     networkdomain - VPC network domain. All networks inside the VPC will belong 
      #       to this domain
      #     projectid - create VPC for the project

      args.merge!('command' => 'createVPC')
      if not args.has_key?('cidr')
          raise ArgumentError, "Missing required argument 'cidr'"
      end
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('vpcofferingid')
          raise ArgumentError, "Missing required argument 'vpcofferingid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def listVPCs(args={})
      # Lists VPCs
      # 
      # args - A dictionary. The following are options for keys:
      #     account - list by account associated with the VPC. Must be used with the dom
      #       ainId parameter.
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     cidr - list by cidr of the VPC. All VPC guest networks' cidrs should be with
      #       in this CIDR
      #     displaytext - List by display text of the VPC
      #     domainid - list by domain ID associated with the VPC. If used with the accou
      #       nt parameter returns the VPC associated with the account for the specified domai
      #       n.
      #     domainid - list only resources belonging to the domain specified
      #     id - list VPC by id
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list by name of the VPC
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     restartrequired - list VPCs by restartRequired option
      #     state - list VPCs by state
      #     supportedservices - list VPC supporting certain services
      #     tags - List resources by tags (key/value pairs)
      #     vpcofferingid - list by ID of the VPC offering
      #     zoneid - list by zone
      #     page - Pagination

      args.merge!('command' => 'listVPCs')

      return request(args)
  end
 

  def deleteVPC(args={})
      # Deletes a VPC
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the VPC

      args.merge!('command' => 'deleteVPC')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateVPC(args={})
      # Updates a VPC
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the VPC
      #     id - the id of the VPC
      #     name - the name of the VPC

      args.merge!('command' => 'updateVPC')

      return request(args)
  end
 

  def restartVPC(args={})
      # Restarts a VPC
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the VPC

      args.merge!('command' => 'restartVPC')

      return request(args)
  end
 

  def createVPCOffering(args={})
      # Creates VPC offering
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the vpc offering
      #     name - the name of the vpc offering
      #     supportedservices - services supported by the vpc offering

      args.merge!('command' => 'createVPCOffering')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('supportedservices')
          raise ArgumentError, "Missing required argument 'supportedservices'"
      end

      return request(args)
  end
 

  def updateVPCOffering(args={})
      # Updates VPC offering
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the VPC offering
      #     id - the id of the VPC offering
      #     name - the name of the VPC offering
      #     state - update state for the VPC offering; supported states - Enabled/Disabl
      #       ed

      args.merge!('command' => 'updateVPCOffering')

      return request(args)
  end
 

  def deleteVPCOffering(args={})
      # Deletes VPC offering
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the VPC offering

      args.merge!('command' => 'deleteVPCOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listVPCOfferings(args={})
      # Lists VPC offerings
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - list VPC offerings by display text
      #     id - list VPC offerings by id
      #     isdefault - true if need to list only default VPC offerings. Default value i
      #       s false
      #     keyword - List by keyword
      #     name - list VPC offerings by name
      #     page - 
      #     pagesize - 
      #     state - list VPC offerings by state
      #     supportedservices - list VPC offerings supporting certain services
      #     page - Pagination

      args.merge!('command' => 'listVPCOfferings')

      return request(args)
  end
 

  def createPrivateGateway(args={})
      # Creates a private gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     gateway - the gateway of the Private gateway
      #     ipaddress - the IP address of the Private gateaway
      #     netmask - the netmask of the Private gateway
      #     vlan - the Vlan for the private gateway
      #     vpcid - the VPC network belongs to
      #     physicalnetworkid - the Physical Network ID the network belongs to

      args.merge!('command' => 'createPrivateGateway')
      if not args.has_key?('gateway')
          raise ArgumentError, "Missing required argument 'gateway'"
      end
      if not args.has_key?('ipaddress')
          raise ArgumentError, "Missing required argument 'ipaddress'"
      end
      if not args.has_key?('netmask')
          raise ArgumentError, "Missing required argument 'netmask'"
      end
      if not args.has_key?('vlan')
          raise ArgumentError, "Missing required argument 'vlan'"
      end
      if not args.has_key?('vpcid')
          raise ArgumentError, "Missing required argument 'vpcid'"
      end

      return request(args)
  end
 

  def listPrivateGateways(args={})
      # List private gateways
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - list private gateway by id
      #     ipaddress - list gateways by ip address
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     state - list gateways by state
      #     vlan - list gateways by vlan
      #     vpcid - list gateways by vpc
      #     page - Pagination

      args.merge!('command' => 'listPrivateGateways')

      return request(args)
  end
 

  def deletePrivateGateway(args={})
      # Deletes a Private gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the private gateway

      args.merge!('command' => 'deletePrivateGateway')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createStaticRoute(args={})
      # Creates a static route
      # 
      # args - A dictionary. The following are options for keys:
      #     cidr - static route cidr
      #     gatewayid - the gateway id we are creating static route for

      args.merge!('command' => 'createStaticRoute')
      if not args.has_key?('cidr')
          raise ArgumentError, "Missing required argument 'cidr'"
      end
      if not args.has_key?('gatewayid')
          raise ArgumentError, "Missing required argument 'gatewayid'"
      end

      return request(args)
  end
 

  def deleteStaticRoute(args={})
      # Deletes a static route
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the static route

      args.merge!('command' => 'deleteStaticRoute')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listStaticRoutes(args={})
      # Lists all static routes
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     gatewayid - list static routes by gateway id
      #     id - list static route by id
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     vpcid - list static routes by vpc id
      #     page - Pagination

      args.merge!('command' => 'listStaticRoutes')

      return request(args)
  end
 

  def deployVirtualMachine(args={})
      # Creates and automatically starts a virtual machine based on a service offering, 
      # disk offering, and template.
      # 
      # args - A dictionary. The following are options for keys:
      #     serviceofferingid - the ID of the service offering for the virtual machine
      #     templateid - the ID of the template for the virtual machine
      #     zoneid - availability zone for the virtual machine
      #     account - an optional account for the virtual machine. Must be used with dom
      #       ainId.
      #     diskofferingid - the ID of the disk offering for the virtual machine. If the
      #        template is of ISO format, the diskOfferingId is for the root disk volume. Othe
      #       rwise this parameter is used to indicate the offering for the data disk volume. 
      #       If the templateId parameter passed is from a Template object, the diskOfferingId
      #        refers to a DATA Disk Volume created. If the templateId parameter passed is fro
      #       m an ISO object, the diskOfferingId refers to a ROOT Disk Volume created.
      #     displayname - an optional user generated name for the virtual machine
      #     domainid - an optional domainId for the virtual machine. If the account para
      #       meter is used, domainId must also be used.
      #     group - an optional group for the virtual machine
      #     hostid - destination Host ID to deploy the VM to - parameter available for r
      #       oot admin only
      #     hypervisor - the hypervisor on which to deploy the virtual machine
      #     ipaddress - the ip address for default vm's network
      #     iptonetworklist - ip to network mapping. Can't be specified with networkIds 
      #       parameter. Example: iptonetworklist[0].ip=10.10.10.11&iptonetworklist[0].network
      #       id=204 - requests to use ip 10.10.10.11 in network id=204
      #     keyboard - an optional keyboard device type for the virtual machine. valid v
      #       alue can be one of de,de-ch,es,fi,fr,fr-be,fr-ch,is,it,jp,nl-be,no,pt,uk,us
      #     keypair - name of the ssh key pair used to login to the virtual machine
      #     name - host name for the virtual machine
      #     networkids - list of network ids used by virtual machine. Can't be specified
      #        with ipToNetworkList parameter
      #     projectid - Deploy vm for the project
      #     securitygroupids - comma separated list of security groups id that going to 
      #       be applied to the virtual machine. Should be passed only when vm is created from
      #        a zone with Basic Network support. Mutually exclusive with securitygroupnames p
      #       arameter
      #     securitygroupnames - comma separated list of security groups names that goin
      #       g to be applied to the virtual machine. Should be passed only when vm is created
      #        from a zone with Basic Network support. Mutually exclusive with securitygroupid
      #       s parameter
      #     size - the arbitrary size for the DATADISK volume. Mutually exclusive with d
      #       iskOfferingId
      #     startvm - true if network offering supports specifying ip ranges; defaulted 
      #       to true if not specified
      #     userdata - an optional binary data that can be sent to the virtual machine u
      #       pon a successful deployment. This binary data must be base64 encoded before addi
      #       ng it to the request. Currently only HTTP GET is supported. Using HTTP GET (via 
      #       querystring), you can send up to 2KB of data after base64 encoding.

      args.merge!('command' => 'deployVirtualMachine')
      if not args.has_key?('serviceofferingid')
          raise ArgumentError, "Missing required argument 'serviceofferingid'"
      end
      if not args.has_key?('templateid')
          raise ArgumentError, "Missing required argument 'templateid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def destroyVirtualMachine(args={})
      # Destroys a virtual machine. Once destroyed, only the administrator can recover i
      # t.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine

      args.merge!('command' => 'destroyVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def rebootVirtualMachine(args={})
      # Reboots a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine

      args.merge!('command' => 'rebootVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def startVirtualMachine(args={})
      # Starts a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine
      #     hostid - destination Host ID to deploy the VM to - parameter available for r
      #       oot admin only

      args.merge!('command' => 'startVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def stopVirtualMachine(args={})
      # Stops a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine
      #     forced - Force stop the VM (vm is marked as Stopped even when command fails 
      #       to be send to the backend).  The caller knows the VM is stopped.

      args.merge!('command' => 'stopVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def resetPasswordForVirtualMachine(args={})
      # Resets the password for virtual machine. The virtual machine must be in a "Stopp
      # ed" state and the template must already support this feature for this command to
      #  take effect. [async]
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine

      args.merge!('command' => 'resetPasswordForVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def changeServiceForVirtualMachine(args={})
      # Changes the service offering for a virtual machine. The virtual machine must be 
      # in a "Stopped" state for this command to take effect.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine
      #     serviceofferingid - the service offering ID to apply to the virtual machine

      args.merge!('command' => 'changeServiceForVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('serviceofferingid')
          raise ArgumentError, "Missing required argument 'serviceofferingid'"
      end

      return request(args)
  end
 

  def updateVirtualMachine(args={})
      # Updates properties of a virtual machine. The VM has to be stopped and restarted 
      # for the new properties to take effect. UpdateVirtualMachine does not first check
      #  whether the VM is stopped. Therefore, stop the VM manually before issuing this 
      # call.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine
      #     displayname - user generated name
      #     group - group of the virtual machine
      #     haenable - true if high-availability is enabled for the virtual machine, fal
      #       se otherwise
      #     ostypeid - the ID of the OS type that best represents this VM.
      #     userdata - an optional binary data that can be sent to the virtual machine u
      #       pon a successful deployment. This binary data must be base64 encoded before addi
      #       ng it to the request. Currently only HTTP GET is supported. Using HTTP GET (via 
      #       querystring), you can send up to 2KB of data after base64 encoding.

      args.merge!('command' => 'updateVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def recoverVirtualMachine(args={})
      # Recovers a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine

      args.merge!('command' => 'recoverVirtualMachine')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listVirtualMachines(args={})
      # List the virtual machines owned by the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     details - comma separated list of host details requested, value can be a lis
      #       t of [all, group, nics, stats, secgrp, tmpl, servoff, iso, volume, min]. If no p
      #       arameter is passed in, the details will be defaulted to all
      #     domainid - list only resources belonging to the domain specified
      #     forvirtualnetwork - list by network type; true if need to list vms using Vir
      #       tual Network, false otherwise
      #     groupid - the group ID
      #     hostid - the host ID
      #     hypervisor - the target hypervisor for the template
      #     id - the ID of the virtual machine
      #     isoid - list vms by iso
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - name of the virtual machine
      #     networkid - list by network id
      #     page - 
      #     pagesize - 
      #     podid - the pod ID
      #     projectid - list objects by project
      #     state - state of the virtual machine
      #     storageid - the storage ID where vm's volumes belong to
      #     tags - List resources by tags (key/value pairs)
      #     templateid - list vms by template
      #     vpcid - list vms by vpc
      #     zoneid - the availability zone ID
      #     page - Pagination

      args.merge!('command' => 'listVirtualMachines')

      return request(args)
  end
 

  def getVMPassword(args={})
      # Returns an encrypted password for the VM
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the virtual machine

      args.merge!('command' => 'getVMPassword')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def migrateVirtualMachine(args={})
      # Attempts Migration of a VM to a different host or Root volume of the vm to a dif
      # ferent storage pool
      # 
      # args - A dictionary. The following are options for keys:
      #     virtualmachineid - the ID of the virtual machine
      #     hostid - Destination Host ID to migrate VM to. Required for live migrating a
      #        VM from host to host
      #     storageid - Destination storage pool ID to migrate VM volumes to. Required f
      #       or migrating the root disk volume

      args.merge!('command' => 'migrateVirtualMachine')
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def assignVirtualMachine(args={})
      # Move a user VM to another user under same domain.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - account name of the new VM owner.
      #     domainid - domain id of the new VM owner.
      #     virtualmachineid - the vm ID of the user VM to be moved
      #     networkids - list of network ids that will be part of VM network after move 
      #       in advanced network setting.
      #     securitygroupids - comma separated list of security groups id that going to 
      #       be applied to the virtual machine. Should be passed only when vm is moved in a z
      #       one with Basic Network support.

      args.merge!('command' => 'assignVirtualMachine')
      if not args.has_key?('account')
          raise ArgumentError, "Missing required argument 'account'"
      end
      if not args.has_key?('domainid')
          raise ArgumentError, "Missing required argument 'domainid'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def restoreVirtualMachine(args={})
      # Restore a VM to original template or specific snapshot
      # 
      # args - A dictionary. The following are options for keys:
      #     virtualmachineid - Virtual Machine ID

      args.merge!('command' => 'restoreVirtualMachine')
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def createRemoteAccessVpn(args={})
      # Creates a l2tp/ipsec remote access vpn
      # 
      # args - A dictionary. The following are options for keys:
      #     publicipid - public ip address id of the vpn server
      #     account - an optional account for the VPN. Must be used with domainId.
      #     domainid - an optional domainId for the VPN. If the account parameter is use
      #       d, domainId must also be used.
      #     iprange - the range of ip addresses to allocate to vpn clients. The first ip
      #        in the range will be taken by the vpn server
      #     openfirewall - if true, firewall rule for source/end pubic port is automatic
      #       ally created; if false - firewall rule has to be created explicitely. Has value 
      #       true by default

      args.merge!('command' => 'createRemoteAccessVpn')
      if not args.has_key?('publicipid')
          raise ArgumentError, "Missing required argument 'publicipid'"
      end

      return request(args)
  end
 

  def deleteRemoteAccessVpn(args={})
      # Destroys a l2tp/ipsec remote access vpn
      # 
      # args - A dictionary. The following are options for keys:
      #     publicipid - public ip address id of the vpn server

      args.merge!('command' => 'deleteRemoteAccessVpn')
      if not args.has_key?('publicipid')
          raise ArgumentError, "Missing required argument 'publicipid'"
      end

      return request(args)
  end
 

  def listRemoteAccessVpns(args={})
      # Lists remote access vpns
      # 
      # args - A dictionary. The following are options for keys:
      #     publicipid - public ip address id of the vpn server
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     page - Pagination

      args.merge!('command' => 'listRemoteAccessVpns')
      if not args.has_key?('publicipid')
          raise ArgumentError, "Missing required argument 'publicipid'"
      end

      return request(args)
  end
 

  def createVpnCustomerGateway(args={})
      # Creates site to site vpn customer gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     cidrlist - guest cidr list of the customer gateway
      #     esppolicy - ESP policy of the customer gateway
      #     gateway - public ip address id of the customer gateway
      #     ikepolicy - IKE policy of the customer gateway
      #     ipsecpsk - IPsec Preshared-Key of the customer gateway
      #     account - the account associated with the gateway. Must be used with the dom
      #       ainId parameter.
      #     domainid - the domain ID associated with the gateway. If used with the accou
      #       nt parameter returns the gateway associated with the account for the specified d
      #       omain.
      #     dpd - If DPD is enabled for VPN connection
      #     esplifetime - Lifetime of phase 2 VPN connection to the customer gateway, in
      #        seconds
      #     ikelifetime - Lifetime of phase 1 VPN connection to the customer gateway, in
      #        seconds
      #     name - name of this customer gateway

      args.merge!('command' => 'createVpnCustomerGateway')
      if not args.has_key?('cidrlist')
          raise ArgumentError, "Missing required argument 'cidrlist'"
      end
      if not args.has_key?('esppolicy')
          raise ArgumentError, "Missing required argument 'esppolicy'"
      end
      if not args.has_key?('gateway')
          raise ArgumentError, "Missing required argument 'gateway'"
      end
      if not args.has_key?('ikepolicy')
          raise ArgumentError, "Missing required argument 'ikepolicy'"
      end
      if not args.has_key?('ipsecpsk')
          raise ArgumentError, "Missing required argument 'ipsecpsk'"
      end

      return request(args)
  end
 

  def createVpnGateway(args={})
      # Creates site to site vpn local gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     vpcid - public ip address id of the vpn gateway

      args.merge!('command' => 'createVpnGateway')
      if not args.has_key?('vpcid')
          raise ArgumentError, "Missing required argument 'vpcid'"
      end

      return request(args)
  end
 

  def createVpnConnection(args={})
      # Create site to site vpn connection
      # 
      # args - A dictionary. The following are options for keys:
      #     s2scustomergatewayid - id of the customer gateway
      #     s2svpngatewayid - id of the vpn gateway

      args.merge!('command' => 'createVpnConnection')
      if not args.has_key?('s2scustomergatewayid')
          raise ArgumentError, "Missing required argument 's2scustomergatewayid'"
      end
      if not args.has_key?('s2svpngatewayid')
          raise ArgumentError, "Missing required argument 's2svpngatewayid'"
      end

      return request(args)
  end
 

  def deleteVpnCustomerGateway(args={})
      # Delete site to site vpn customer gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of customer gateway

      args.merge!('command' => 'deleteVpnCustomerGateway')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteVpnGateway(args={})
      # Delete site to site vpn gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of customer gateway

      args.merge!('command' => 'deleteVpnGateway')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteVpnConnection(args={})
      # Delete site to site vpn connection
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of vpn connection

      args.merge!('command' => 'deleteVpnConnection')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateVpnCustomerGateway(args={})
      # Update site to site vpn customer gateway
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of customer gateway
      #     cidrlist - guest cidr of the customer gateway
      #     esppolicy - ESP policy of the customer gateway
      #     gateway - public ip address id of the customer gateway
      #     ikepolicy - IKE policy of the customer gateway
      #     ipsecpsk - IPsec Preshared-Key of the customer gateway
      #     account - the account associated with the gateway. Must be used with the dom
      #       ainId parameter.
      #     domainid - the domain ID associated with the gateway. If used with the accou
      #       nt parameter returns the gateway associated with the account for the specified d
      #       omain.
      #     dpd - If DPD is enabled for VPN connection
      #     esplifetime - Lifetime of phase 2 VPN connection to the customer gateway, in
      #        seconds
      #     ikelifetime - Lifetime of phase 1 VPN connection to the customer gateway, in
      #        seconds
      #     name - name of this customer gateway

      args.merge!('command' => 'updateVpnCustomerGateway')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('cidrlist')
          raise ArgumentError, "Missing required argument 'cidrlist'"
      end
      if not args.has_key?('esppolicy')
          raise ArgumentError, "Missing required argument 'esppolicy'"
      end
      if not args.has_key?('gateway')
          raise ArgumentError, "Missing required argument 'gateway'"
      end
      if not args.has_key?('ikepolicy')
          raise ArgumentError, "Missing required argument 'ikepolicy'"
      end
      if not args.has_key?('ipsecpsk')
          raise ArgumentError, "Missing required argument 'ipsecpsk'"
      end

      return request(args)
  end
 

  def resetVpnConnection(args={})
      # Reset site to site vpn connection
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of vpn connection
      #     account - an optional account for connection. Must be used with domainId.
      #     domainid - an optional domainId for connection. If the account parameter is 
      #       used, domainId must also be used.

      args.merge!('command' => 'resetVpnConnection')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listVpnCustomerGateways(args={})
      # Lists site to site vpn customer gateways
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - id of the customer gateway
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     page - Pagination

      args.merge!('command' => 'listVpnCustomerGateways')

      return request(args)
  end
 

  def listVpnGateways(args={})
      # Lists site 2 site vpn gateways
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - id of the vpn gateway
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     vpcid - id of vpc
      #     page - Pagination

      args.merge!('command' => 'listVpnGateways')

      return request(args)
  end
 

  def listVpnConnections(args={})
      # Lists site to site vpn connection gateways
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - id of the vpn connection
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     vpcid - id of vpc
      #     page - Pagination

      args.merge!('command' => 'listVpnConnections')

      return request(args)
  end
 

  def addTrafficType(args={})
      # Adds traffic type to a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     physicalnetworkid - the Physical Network ID
      #     traffictype - the trafficType to be added to the physical network
      #     kvmnetworklabel - The network name label of the physical device dedicated to
      #        this traffic on a KVM host
      #     vlan - The VLAN id to be used for Management traffic by VMware host
      #     vmwarenetworklabel - The network name label of the physical device dedicated
      #        to this traffic on a VMware host
      #     xennetworklabel - The network name label of the physical device dedicated to
      #        this traffic on a XenServer host

      args.merge!('command' => 'addTrafficType')
      if not args.has_key?('physicalnetworkid')
          raise ArgumentError, "Missing required argument 'physicalnetworkid'"
      end
      if not args.has_key?('traffictype')
          raise ArgumentError, "Missing required argument 'traffictype'"
      end

      return request(args)
  end
 

  def deleteTrafficType(args={})
      # Deletes traffic type of a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - traffic type id

      args.merge!('command' => 'deleteTrafficType')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listTrafficTypes(args={})
      # Lists traffic types of a given physical network.
      # 
      # args - A dictionary. The following are options for keys:
      #     physicalnetworkid - the Physical Network ID
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listTrafficTypes')
      if not args.has_key?('physicalnetworkid')
          raise ArgumentError, "Missing required argument 'physicalnetworkid'"
      end

      return request(args)
  end
 

  def updateTrafficType(args={})
      # Updates traffic type of a physical network
      # 
      # args - A dictionary. The following are options for keys:
      #     id - traffic type id
      #     kvmnetworklabel - The network name label of the physical device dedicated to
      #        this traffic on a KVM host
      #     vmwarenetworklabel - The network name label of the physical device dedicated
      #        to this traffic on a VMware host
      #     xennetworklabel - The network name label of the physical device dedicated to
      #        this traffic on a XenServer host

      args.merge!('command' => 'updateTrafficType')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listTrafficTypeImplementors(args={})
      # Lists implementors of implementor of a network traffic type or implementors of a
      # ll network traffic types
      # 
      # args - A dictionary. The following are options for keys:
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     traffictype - Optional. The network traffic type, if specified, return its i
      #       mplementor. Otherwise, return all traffic types with their implementor
      #     page - Pagination

      args.merge!('command' => 'listTrafficTypeImplementors')

      return request(args)
  end
 

  def generateUsageRecords(args={})
      # Generates usage records. This will generate records only if there any records to
      #  be generated, i.e if the scheduled usage job was not run or failed
      # 
      # args - A dictionary. The following are options for keys:
      #     enddate - End date range for usage record query. Use yyyy-MM-dd as the date 
      #       format, e.g. startDate=2009-06-03.
      #     startdate - Start date range for usage record query. Use yyyy-MM-dd as the d
      #       ate format, e.g. startDate=2009-06-01.
      #     domainid - List events for the specified domain.

      args.merge!('command' => 'generateUsageRecords')
      if not args.has_key?('enddate')
          raise ArgumentError, "Missing required argument 'enddate'"
      end
      if not args.has_key?('startdate')
          raise ArgumentError, "Missing required argument 'startdate'"
      end

      return request(args)
  end
 

  def listUsageRecords(args={})
      # Lists usage records for accounts
      # 
      # args - A dictionary. The following are options for keys:
      #     enddate - End date range for usage record query. Use yyyy-MM-dd as the date 
      #       format, e.g. startDate=2009-06-03.
      #     startdate - Start date range for usage record query. Use yyyy-MM-dd as the d
      #       ate format, e.g. startDate=2009-06-01.
      #     account - List usage records for the specified user.
      #     accountid - List usage records for the specified account
      #     domainid - List usage records for the specified domain.
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     projectid - List usage records for specified project
      #     type - List usage records for the specified usage type
      #     page - Pagination

      args.merge!('command' => 'listUsageRecords')
      if not args.has_key?('enddate')
          raise ArgumentError, "Missing required argument 'enddate'"
      end
      if not args.has_key?('startdate')
          raise ArgumentError, "Missing required argument 'startdate'"
      end

      return request(args)
  end
 

  def listUsageTypes(args={})
      # List Usage Types
      # 
      # args - A dictionary. The following are options for keys:
      #     page - Pagination

      args.merge!('command' => 'listUsageTypes')

      return request(args)
  end
 

  def addTrafficMonitor(args={})
      # Adds Traffic Monitor Host for Direct Network Usage
      # 
      # args - A dictionary. The following are options for keys:
      #     url - URL of the traffic monitor Host
      #     zoneid - Zone in which to add the external firewall appliance.

      args.merge!('command' => 'addTrafficMonitor')
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def deleteTrafficMonitor(args={})
      # Deletes an traffic monitor host.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Id of the Traffic Monitor Host.

      args.merge!('command' => 'deleteTrafficMonitor')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listTrafficMonitors(args={})
      # List traffic monitor Hosts.
      # 
      # args - A dictionary. The following are options for keys:
      #     zoneid - zone Id
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listTrafficMonitors')
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def createUser(args={})
      # Creates a user for an account that already exists
      # 
      # args - A dictionary. The following are options for keys:
      #     account - Creates the user under the specified account. If no account is spe
      #       cified, the username will be used as the account name.
      #     email - email
      #     firstname - firstname
      #     lastname - lastname
      #     password - Hashed password (Default is MD5). If you wish to use any other ha
      #       shing algorithm, you would need to write a custom authentication adapter See Doc
      #       s section.
      #     username - Unique username.
      #     domainid - Creates the user under the specified domain. Has to be accompanie
      #       d with the account parameter
      #     timezone - Specifies a timezone for this command. For more information on th
      #       e timezone parameter, see Time Zone Format.

      args.merge!('command' => 'createUser')
      if not args.has_key?('account')
          raise ArgumentError, "Missing required argument 'account'"
      end
      if not args.has_key?('email')
          raise ArgumentError, "Missing required argument 'email'"
      end
      if not args.has_key?('firstname')
          raise ArgumentError, "Missing required argument 'firstname'"
      end
      if not args.has_key?('lastname')
          raise ArgumentError, "Missing required argument 'lastname'"
      end
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def deleteUser(args={})
      # Creates a user for an account
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Deletes a user

      args.merge!('command' => 'deleteUser')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateUser(args={})
      # Updates a user account
      # 
      # args - A dictionary. The following are options for keys:
      #     id - User id
      #     email - email
      #     firstname - first name
      #     lastname - last name
      #     password - Hashed password (default is MD5). If you wish to use any other ha
      #       sing algorithm, you would need to write a custom authentication adapter
      #     timezone - Specifies a timezone for this command. For more information on th
      #       e timezone parameter, see Time Zone Format.
      #     userapikey - The API key for the user. Must be specified with userSecretKey
      #     username - Unique username
      #     usersecretkey - The secret key for the user. Must be specified with userApiK
      #       ey

      args.merge!('command' => 'updateUser')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listUsers(args={})
      # Lists user accounts
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     accounttype - List users by account type. Valid types include admin, domain-
      #       admin, read-only-admin, or user.
      #     domainid - list only resources belonging to the domain specified
      #     id - List user by ID.
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     state - List users by state of the user account.
      #     username - List user by the username
      #     page - Pagination

      args.merge!('command' => 'listUsers')

      return request(args)
  end
 

  def disableUser(args={})
      # Disables a user account
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Disables user by user ID.

      args.merge!('command' => 'disableUser')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def enableUser(args={})
      # Enables a user account
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Enables user by user ID.

      args.merge!('command' => 'enableUser')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def getUser(args={})
      # Find user account by API key
      # 
      # args - A dictionary. The following are options for keys:
      #     userapikey - API key of the user

      args.merge!('command' => 'getUser')
      if not args.has_key?('userapikey')
          raise ArgumentError, "Missing required argument 'userapikey'"
      end

      return request(args)
  end
 

  def addVpnUser(args={})
      # Adds vpn users
      # 
      # args - A dictionary. The following are options for keys:
      #     password - password for the username
      #     username - username for the vpn user
      #     account - an optional account for the vpn user. Must be used with domainId.
      #     domainid - an optional domainId for the vpn user. If the account parameter i
      #       s used, domainId must also be used.
      #     projectid - add vpn user to the specific project

      args.merge!('command' => 'addVpnUser')
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def removeVpnUser(args={})
      # Removes vpn user
      # 
      # args - A dictionary. The following are options for keys:
      #     username - username for the vpn user
      #     account - an optional account for the vpn user. Must be used with domainId.
      #     domainid - an optional domainId for the vpn user. If the account parameter i
      #       s used, domainId must also be used.
      #     projectid - remove vpn user from the project

      args.merge!('command' => 'removeVpnUser')
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def listVpnUsers(args={})
      # Lists vpn users
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - the ID of the vpn user
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     username - the username of the vpn user.
      #     page - Pagination

      args.merge!('command' => 'listVpnUsers')

      return request(args)
  end
 

  def createLoadBalancerRule(args={})
      # Creates a load balancer rule
      # 
      # args - A dictionary. The following are options for keys:
      #     algorithm - load balancer algorithm (source, roundrobin, leastconn)
      #     name - name of the load balancer rule
      #     privateport - the private port of the private ip address/virtual machine whe
      #       re the network traffic will be load balanced to
      #     publicport - the public port from where the network traffic will be load bal
      #       anced from
      #     account - the account associated with the load balancer. Must be used with t
      #       he domainId parameter.
      #     cidrlist - the cidr list to forward traffic from
      #     description - the description of the load balancer rule
      #     domainid - the domain ID associated with the load balancer
      #     networkid - The guest network this rule will be created for. Required when p
      #       ublic Ip address is not associated with any Guest network yet (VPC case)
      #     openfirewall - if true, firewall rule for source/end pubic port is automatic
      #       ally created; if false - firewall rule has to be created explicitely. If not spe
      #       cified 1) defaulted to false when LB rule is being created for VPC guest network
      #        2) in all other cases defaulted to true
      #     publicipid - public ip address id from where the network traffic will be loa
      #       d balanced from
      #     zoneid - zone where the load balancer is going to be created. This parameter
      #        is required when LB service provider is ElasticLoadBalancerVm

      args.merge!('command' => 'createLoadBalancerRule')
      if not args.has_key?('algorithm')
          raise ArgumentError, "Missing required argument 'algorithm'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('privateport')
          raise ArgumentError, "Missing required argument 'privateport'"
      end
      if not args.has_key?('publicport')
          raise ArgumentError, "Missing required argument 'publicport'"
      end

      return request(args)
  end
 

  def deleteLoadBalancerRule(args={})
      # Deletes a load balancer rule.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the load balancer rule

      args.merge!('command' => 'deleteLoadBalancerRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def removeFromLoadBalancerRule(args={})
      # Removes a virtual machine or a list of virtual machines from a load balancer rul
      # e.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the load balancer rule
      #     virtualmachineids - the list of IDs of the virtual machines that are being r
      #       emoved from the load balancer rule (i.e. virtualMachineIds=1,2,3)

      args.merge!('command' => 'removeFromLoadBalancerRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('virtualmachineids')
          raise ArgumentError, "Missing required argument 'virtualmachineids'"
      end

      return request(args)
  end
 

  def assignToLoadBalancerRule(args={})
      # Assigns virtual machine or a list of virtual machines to a load balancer rule.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the load balancer rule
      #     virtualmachineids - the list of IDs of the virtual machine that are being as
      #       signed to the load balancer rule(i.e. virtualMachineIds=1,2,3)

      args.merge!('command' => 'assignToLoadBalancerRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('virtualmachineids')
          raise ArgumentError, "Missing required argument 'virtualmachineids'"
      end

      return request(args)
  end
 

  def createLBStickinessPolicy(args={})
      # Creates a Load Balancer stickiness policy
      # 
      # args - A dictionary. The following are options for keys:
      #     lbruleid - the ID of the load balancer rule
      #     methodname - name of the LB Stickiness policy method, possible values can be
      #        obtained from ListNetworks API
      #     name - name of the LB Stickiness policy
      #     description - the description of the LB Stickiness policy
      #     param - param list. Example: param[0].name=cookiename&param[0].value=LBCooki
      #       e

      args.merge!('command' => 'createLBStickinessPolicy')
      if not args.has_key?('lbruleid')
          raise ArgumentError, "Missing required argument 'lbruleid'"
      end
      if not args.has_key?('methodname')
          raise ArgumentError, "Missing required argument 'methodname'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteLBStickinessPolicy(args={})
      # Deletes a LB stickiness policy.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the LB stickiness policy

      args.merge!('command' => 'deleteLBStickinessPolicy')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listLoadBalancerRules(args={})
      # Lists load balancer rules.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - the ID of the load balancer rule
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - the name of the load balancer rule
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     publicipid - the public IP address id of the load balancer rule
      #     tags - List resources by tags (key/value pairs)
      #     virtualmachineid - the ID of the virtual machine of the load balancer rule
      #     zoneid - the availability zone ID
      #     page - Pagination

      args.merge!('command' => 'listLoadBalancerRules')

      return request(args)
  end
 

  def listLBStickinessPolicies(args={})
      # Lists LBStickiness policies.
      # 
      # args - A dictionary. The following are options for keys:
      #     lbruleid - the ID of the load balancer rule
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listLBStickinessPolicies')
      if not args.has_key?('lbruleid')
          raise ArgumentError, "Missing required argument 'lbruleid'"
      end

      return request(args)
  end
 

  def listLoadBalancerRuleInstances(args={})
      # List all virtual machine instances that are assigned to a load balancer rule.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the load balancer rule
      #     applied - true if listing all virtual machines currently applied to the load
      #        balancer rule; default is true
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listLoadBalancerRuleInstances')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateLoadBalancerRule(args={})
      # Updates load balancer
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the load balancer rule to update
      #     algorithm - load balancer algorithm (source, roundrobin, leastconn)
      #     description - the description of the load balancer rule
      #     name - the name of the load balancer rule

      args.merge!('command' => 'updateLoadBalancerRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createTemplate(args={})
      # Creates a template of a virtual machine. The virtual machine must be in a STOPPE
      # D state. A template created from this command is automatically designated as a p
      # rivate template visible to the account that created it.
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the template. This is usually used for dis
      #       play purposes.
      #     name - the name of the template
      #     ostypeid - the ID of the OS Type that best represents the OS of this templat
      #       e.
      #     bits - 32 or 64 bit
      #     details - Template details in key/value pairs.
      #     isfeatured - true if this template is a featured template, false otherwise
      #     ispublic - true if this template is a public template, false otherwise
      #     passwordenabled - true if the template supports the password reset feature; 
      #       default is false
      #     requireshvm - true if the template requres HVM, false otherwise
      #     snapshotid - the ID of the snapshot the template is being created from. Eith
      #       er this parameter, or volumeId has to be passed in
      #     templatetag - the tag for this template.
      #     url - Optional, only for baremetal hypervisor. The directory name where temp
      #       late stored on CIFS server
      #     virtualmachineid - Optional, VM ID. If this presents, it is going to create 
      #       a baremetal template for VM this ID refers to. This is only for VM whose hypervi
      #       sor type is BareMetal
      #     volumeid - the ID of the disk volume the template is being created from. Eit
      #       her this parameter, or snapshotId has to be passed in

      args.merge!('command' => 'createTemplate')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('ostypeid')
          raise ArgumentError, "Missing required argument 'ostypeid'"
      end

      return request(args)
  end
 

  def updateTemplate(args={})
      # Updates attributes of a template.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the image file
      #     bootable - true if image is bootable, false otherwise
      #     displaytext - the display text of the image
      #     format - the format for the image
      #     name - the name of the image file
      #     ostypeid - the ID of the OS type that best represents the OS of this image.
      #     passwordenabled - true if the image supports the password reset feature; def
      #       ault is false
      #     sortkey - sort key of the template, integer

      args.merge!('command' => 'updateTemplate')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def copyTemplate(args={})
      # Copies a template from one zone to another.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Template ID.
      #     destzoneid - ID of the zone the template is being copied to.
      #     sourcezoneid - ID of the zone the template is currently hosted on.

      args.merge!('command' => 'copyTemplate')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('destzoneid')
          raise ArgumentError, "Missing required argument 'destzoneid'"
      end
      if not args.has_key?('sourcezoneid')
          raise ArgumentError, "Missing required argument 'sourcezoneid'"
      end

      return request(args)
  end
 

  def deleteTemplate(args={})
      # Deletes a template from the system. All virtual machines using the deleted templ
      # ate will not be affected.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the template
      #     zoneid - the ID of zone of the template

      args.merge!('command' => 'deleteTemplate')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listTemplates(args={})
      # List all public, private, and privileged templates.
      # 
      # args - A dictionary. The following are options for keys:
      #     templatefilter - possible values are "featured", "self", "self-executable", 
      #       "executable", and "community".* featured-templates that are featured and are pub
      #       lic* self-templates that have been registered/created by the owner* selfexecutab
      #       le-templates that have been registered/created by the owner that can be used to 
      #       deploy a new VM* executable-all templates that can be used to deploy a new VM* c
      #       ommunity-templates that are public.
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     hypervisor - the hypervisor for which to restrict the search
      #     id - the template ID
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - the template name
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     zoneid - list templates by zoneId
      #     page - Pagination

      args.merge!('command' => 'listTemplates')
      if not args.has_key?('templatefilter')
          raise ArgumentError, "Missing required argument 'templatefilter'"
      end

      return request(args)
  end
 

  def updateTemplatePermissions(args={})
      # Updates a template visibility permissions. A public template is visible to all a
      # ccounts within the same domain. A private template is visible only to the owner 
      # of the template. A priviledged template is a private template with account permi
      # ssions added. Only accounts specified under the template permissions are visible
      #  to them.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the template ID
      #     accounts - a comma delimited list of accounts. If specified, "op" parameter 
      #       has to be passed in.
      #     isextractable - true if the template/iso is extractable, false other wise. C
      #       an be set only by root admin
      #     isfeatured - true for featured template/iso, false otherwise
      #     ispublic - true for public template/iso, false for private templates/isos
      #     op - permission operator (add, remove, reset)
      #     projectids - a comma delimited list of projects. If specified, "op" paramete
      #       r has to be passed in.

      args.merge!('command' => 'updateTemplatePermissions')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listTemplatePermissions(args={})
      # List template visibility and all accounts that have permissions to view this tem
      # plate.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the template ID
      #     page - Pagination

      args.merge!('command' => 'listTemplatePermissions')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def extractTemplate(args={})
      # Extracts a template
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the template
      #     mode - the mode of extraction - HTTP_DOWNLOAD or FTP_UPLOAD
      #     url - the url to which the ISO would be extracted
      #     zoneid - the ID of the zone where the ISO is originally located

      args.merge!('command' => 'extractTemplate')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('mode')
          raise ArgumentError, "Missing required argument 'mode'"
      end

      return request(args)
  end
 

  def prepareTemplate(args={})
      # load template into primary storage
      # 
      # args - A dictionary. The following are options for keys:
      #     templateid - template ID of the template to be prepared in primary storage(s
      #       ).
      #     zoneid - zone ID of the template to be prepared in primary storage(s).

      args.merge!('command' => 'prepareTemplate')
      if not args.has_key?('templateid')
          raise ArgumentError, "Missing required argument 'templateid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def startRouter(args={})
      # Starts a router.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the router

      args.merge!('command' => 'startRouter')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def rebootRouter(args={})
      # Starts a router.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the router

      args.merge!('command' => 'rebootRouter')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def stopRouter(args={})
      # Stops a router.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the router
      #     forced - Force stop the VM. The caller knows the VM is stopped.

      args.merge!('command' => 'stopRouter')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def destroyRouter(args={})
      # Destroys a router.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the router

      args.merge!('command' => 'destroyRouter')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def changeServiceForRouter(args={})
      # Upgrades domain router to a new service offering
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the router
      #     serviceofferingid - the service offering ID to apply to the domain router

      args.merge!('command' => 'changeServiceForRouter')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('serviceofferingid')
          raise ArgumentError, "Missing required argument 'serviceofferingid'"
      end

      return request(args)
  end
 

  def listRouters(args={})
      # List routers.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     forvpc - if true is passed for this parameter, list only VPC routers
      #     hostid - the host ID of the router
      #     id - the ID of the disk router
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - the name of the router
      #     networkid - list by network id
      #     page - 
      #     pagesize - 
      #     podid - the Pod ID of the router
      #     projectid - list objects by project
      #     state - the state of the router
      #     vpcid - List networks by VPC
      #     zoneid - the Zone ID of the router
      #     page - Pagination

      args.merge!('command' => 'listRouters')

      return request(args)
  end
 

  def createVirtualRouterElement(args={})
      # Create a virtual router element.
      # 
      # args - A dictionary. The following are options for keys:
      #     nspid - the network service provider ID of the virtual router element

      args.merge!('command' => 'createVirtualRouterElement')
      if not args.has_key?('nspid')
          raise ArgumentError, "Missing required argument 'nspid'"
      end

      return request(args)
  end
 

  def configureVirtualRouterElement(args={})
      # Configures a virtual router element.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the virtual router provider
      #     enabled - Enabled/Disabled the service provider

      args.merge!('command' => 'configureVirtualRouterElement')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('enabled')
          raise ArgumentError, "Missing required argument 'enabled'"
      end

      return request(args)
  end
 

  def listVirtualRouterElements(args={})
      # Lists all available virtual router elements.
      # 
      # args - A dictionary. The following are options for keys:
      #     enabled - list network offerings by enabled state
      #     id - list virtual router elements by id
      #     keyword - List by keyword
      #     nspid - list virtual router elements by network service provider id
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listVirtualRouterElements')

      return request(args)
  end
 

  def createProject(args={})
      # Creates a project
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - display text of the project
      #     name - name of the project
      #     account - account who will be Admin for the project
      #     domainid - domain ID of the account owning a project

      args.merge!('command' => 'createProject')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteProject(args={})
      # Deletes a project
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of the project to be deleted

      args.merge!('command' => 'deleteProject')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateProject(args={})
      # Updates a project
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of the project to be modified
      #     account - new Admin account for the project
      #     displaytext - display text of the project

      args.merge!('command' => 'updateProject')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def activateProject(args={})
      # Activates a project
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of the project to be modified

      args.merge!('command' => 'activateProject')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def suspendProject(args={})
      # Suspends a project
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of the project to be suspended

      args.merge!('command' => 'suspendProject')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listProjects(args={})
      # Lists projects and provides detailed information for listed projects
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     displaytext - list projects by display text
      #     domainid - list only resources belonging to the domain specified
      #     id - list projects by project ID
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list projects by name
      #     page - 
      #     pagesize - 
      #     state - list projects by state
      #     tags - List projects by tags (key/value pairs)
      #     page - Pagination

      args.merge!('command' => 'listProjects')

      return request(args)
  end
 

  def listProjectInvitations(args={})
      # Lists projects and provides detailed information for listed projects
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     activeonly - if true, list only active invitations - having Pending state an
      #       d ones that are not timed out yet
      #     domainid - list only resources belonging to the domain specified
      #     id - list invitations by id
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list by project id
      #     state - list invitations by state
      #     page - Pagination

      args.merge!('command' => 'listProjectInvitations')

      return request(args)
  end
 

  def updateProjectInvitation(args={})
      # Accepts or declines project invitation
      # 
      # args - A dictionary. The following are options for keys:
      #     projectid - id of the project to join
      #     accept - if true, accept the invitation, decline if false. True by default
      #     account - account that is joining the project
      #     token - list invitations for specified account; this parameter has to be spe
      #       cified with domainId

      args.merge!('command' => 'updateProjectInvitation')
      if not args.has_key?('projectid')
          raise ArgumentError, "Missing required argument 'projectid'"
      end

      return request(args)
  end
 

  def deleteProjectInvitation(args={})
      # Accepts or declines project invitation
      # 
      # args - A dictionary. The following are options for keys:
      #     id - id of the invitation

      args.merge!('command' => 'deleteProjectInvitation')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def attachIso(args={})
      # Attaches an ISO to a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the ISO file
      #     virtualmachineid - the ID of the virtual machine

      args.merge!('command' => 'attachIso')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def detachIso(args={})
      # Detaches any ISO file (if any) currently attached to a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     virtualmachineid - The ID of the virtual machine

      args.merge!('command' => 'detachIso')
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def listIsos(args={})
      # Lists all available ISO files.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     bootable - true if the ISO is bootable, false otherwise
      #     domainid - list only resources belonging to the domain specified
      #     hypervisor - the hypervisor for which to restrict the search
      #     id - list all isos by id
      #     isofilter - possible values are "featured", "self", "self-executable","execu
      #       table", and "community". * featured-ISOs that are featured and are publicself-IS
      #       Os that have been registered/created by the owner. * selfexecutable-ISOs that ha
      #       ve been registered/created by the owner that can be used to deploy a new VM. * e
      #       xecutable-all ISOs that can be used to deploy a new VM * community-ISOs that are
      #        public.
      #     ispublic - true if the ISO is publicly available to all users, false otherwi
      #       se.
      #     isready - true if this ISO is ready to be deployed
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list all isos by name
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     zoneid - the ID of the zone
      #     page - Pagination

      args.merge!('command' => 'listIsos')

      return request(args)
  end
 

  def updateIso(args={})
      # Updates an ISO file.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the image file
      #     bootable - true if image is bootable, false otherwise
      #     displaytext - the display text of the image
      #     format - the format for the image
      #     name - the name of the image file
      #     ostypeid - the ID of the OS type that best represents the OS of this image.
      #     passwordenabled - true if the image supports the password reset feature; def
      #       ault is false
      #     sortkey - sort key of the template, integer

      args.merge!('command' => 'updateIso')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteIso(args={})
      # Deletes an ISO file.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the ISO file
      #     zoneid - the ID of the zone of the ISO file. If not specified, the ISO will 
      #       be deleted from all the zones

      args.merge!('command' => 'deleteIso')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def copyIso(args={})
      # Copies a template from one zone to another.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Template ID.
      #     destzoneid - ID of the zone the template is being copied to.
      #     sourcezoneid - ID of the zone the template is currently hosted on.

      args.merge!('command' => 'copyIso')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('destzoneid')
          raise ArgumentError, "Missing required argument 'destzoneid'"
      end
      if not args.has_key?('sourcezoneid')
          raise ArgumentError, "Missing required argument 'sourcezoneid'"
      end

      return request(args)
  end
 

  def updateIsoPermissions(args={})
      # Updates iso permissions
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the template ID
      #     accounts - a comma delimited list of accounts. If specified, "op" parameter 
      #       has to be passed in.
      #     isextractable - true if the template/iso is extractable, false other wise. C
      #       an be set only by root admin
      #     isfeatured - true for featured template/iso, false otherwise
      #     ispublic - true for public template/iso, false for private templates/isos
      #     op - permission operator (add, remove, reset)
      #     projectids - a comma delimited list of projects. If specified, "op" paramete
      #       r has to be passed in.

      args.merge!('command' => 'updateIsoPermissions')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listIsoPermissions(args={})
      # List template visibility and all accounts that have permissions to view this tem
      # plate.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the template ID
      #     page - Pagination

      args.merge!('command' => 'listIsoPermissions')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def extractIso(args={})
      # Extracts an ISO
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the ISO file
      #     mode - the mode of extraction - HTTP_DOWNLOAD or FTP_UPLOAD
      #     url - the url to which the ISO would be extracted
      #     zoneid - the ID of the zone where the ISO is originally located

      args.merge!('command' => 'extractIso')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('mode')
          raise ArgumentError, "Missing required argument 'mode'"
      end

      return request(args)
  end
 

  def addHost(args={})
      # Adds a new host.
      # 
      # args - A dictionary. The following are options for keys:
      #     hypervisor - hypervisor type of the host
      #     password - the password for the host
      #     podid - the Pod ID for the host
      #     url - the host URL
      #     username - the username for the host
      #     zoneid - the Zone ID for the host
      #     allocationstate - Allocation state of this Host for allocation of new resour
      #       ces
      #     clusterid - the cluster ID for the host
      #     clustername - the cluster name for the host
      #     hosttags - list of tags to be added to the host

      args.merge!('command' => 'addHost')
      if not args.has_key?('hypervisor')
          raise ArgumentError, "Missing required argument 'hypervisor'"
      end
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('podid')
          raise ArgumentError, "Missing required argument 'podid'"
      end
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def reconnectHost(args={})
      # Reconnects a host.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the host ID

      args.merge!('command' => 'reconnectHost')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateHost(args={})
      # Updates a host.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the host to update
      #     allocationstate - Change resource state of host, valid values are [Enable, D
      #       isable]. Operation may failed if host in states not allowing Enable/Disable
      #     hosttags - list of tags to be added to the host
      #     oscategoryid - the id of Os category to update the host with
      #     url - the new uri for the secondary storage: nfs://host/path

      args.merge!('command' => 'updateHost')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteHost(args={})
      # Deletes a host.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the host ID
      #     forced - Force delete the host. All HA enabled vms running on the host will 
      #       be put to HA; HA disabled ones will be stopped
      #     forcedestroylocalstorage - Force destroy local storage on this host. All VMs
      #        created on this local storage will be destroyed

      args.merge!('command' => 'deleteHost')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def prepareHostForMaintenance(args={})
      # Prepares a host for maintenance.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the host ID

      args.merge!('command' => 'prepareHostForMaintenance')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def cancelHostMaintenance(args={})
      # Cancels host maintenance.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the host ID

      args.merge!('command' => 'cancelHostMaintenance')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listHosts(args={})
      # Lists hosts.
      # 
      # args - A dictionary. The following are options for keys:
      #     clusterid - lists hosts existing in particular cluster
      #     details - comma separated list of host details requested, value can be a lis
      #       t of [ min, all, capacity, events, stats]
      #     hahost - if true, list only hosts dedicated to HA
      #     id - the id of the host
      #     keyword - List by keyword
      #     name - the name of the host
      #     page - 
      #     pagesize - 
      #     podid - the Pod ID for the host
      #     resourcestate - list hosts by resource state. Resource state represents curr
      #       ent state determined by admin of host, valule can be one of [Enabled, Disabled, 
      #       Unmanaged, PrepareForMaintenance, ErrorInMaintenance, Maintenance, Error]
      #     state - the state of the host
      #     type - the host type
      #     virtualmachineid - lists hosts in the same cluster as this VM and flag hosts
      #        with enough CPU/RAm to host this VM
      #     zoneid - the Zone ID for the host
      #     page - Pagination

      args.merge!('command' => 'listHosts')

      return request(args)
  end
 

  def addSecondaryStorage(args={})
      # Adds secondary storage.
      # 
      # args - A dictionary. The following are options for keys:
      #     url - the URL for the secondary storage
      #     zoneid - the Zone ID for the secondary storage

      args.merge!('command' => 'addSecondaryStorage')
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end

      return request(args)
  end
 

  def updateHostPassword(args={})
      # Update password of a host/pool on management server.
      # 
      # args - A dictionary. The following are options for keys:
      #     password - the new password for the host/cluster
      #     username - the username for the host/cluster
      #     clusterid - the cluster ID
      #     hostid - the host ID

      args.merge!('command' => 'updateHostPassword')
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def createAccount(args={})
      # Creates an account
      # 
      # args - A dictionary. The following are options for keys:
      #     accounttype - Type of the account.  Specify 0 for user, 1 for root admin, an
      #       d 2 for domain admin
      #     email - email
      #     firstname - firstname
      #     lastname - lastname
      #     password - Hashed password (Default is MD5). If you wish to use any other ha
      #       shing algorithm, you would need to write a custom authentication adapter See Doc
      #       s section.
      #     username - Unique username.
      #     account - Creates the user under the specified account. If no account is spe
      #       cified, the username will be used as the account name.
      #     accountdetails - details for account used to store specific parameters
      #     domainid - Creates the user under the specified domain.
      #     networkdomain - Network domain for the account's networks
      #     timezone - Specifies a timezone for this command. For more information on th
      #       e timezone parameter, see Time Zone Format.

      args.merge!('command' => 'createAccount')
      if not args.has_key?('accounttype')
          raise ArgumentError, "Missing required argument 'accounttype'"
      end
      if not args.has_key?('email')
          raise ArgumentError, "Missing required argument 'email'"
      end
      if not args.has_key?('firstname')
          raise ArgumentError, "Missing required argument 'firstname'"
      end
      if not args.has_key?('lastname')
          raise ArgumentError, "Missing required argument 'lastname'"
      end
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def deleteAccount(args={})
      # Deletes a account, and all users associated with this account
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Account id

      args.merge!('command' => 'deleteAccount')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateAccount(args={})
      # Updates account information for the authenticated user
      # 
      # args - A dictionary. The following are options for keys:
      #     newname - new name for the account
      #     account - the current account name
      #     accountdetails - details for account used to store specific parameters
      #     domainid - the ID of the domain where the account exists
      #     id - Account id
      #     networkdomain - Network domain for the account's networks; empty string will
      #        update domainName with NULL value

      args.merge!('command' => 'updateAccount')
      if not args.has_key?('newname')
          raise ArgumentError, "Missing required argument 'newname'"
      end

      return request(args)
  end
 

  def disableAccount(args={})
      # Disables an account
      # 
      # args - A dictionary. The following are options for keys:
      #     lock - If true, only lock the account; else disable the account
      #     account - Disables specified account.
      #     domainid - Disables specified account in this domain.
      #     id - Account id

      args.merge!('command' => 'disableAccount')
      if not args.has_key?('lock')
          raise ArgumentError, "Missing required argument 'lock'"
      end

      return request(args)
  end
 

  def enableAccount(args={})
      # Enables an account
      # 
      # args - A dictionary. The following are options for keys:
      #     account - Enables specified account.
      #     domainid - Enables specified account in this domain.
      #     id - Account id

      args.merge!('command' => 'enableAccount')

      return request(args)
  end
 

  def listAccounts(args={})
      # Lists accounts and provides detailed account information for listed accounts
      # 
      # args - A dictionary. The following are options for keys:
      #     accounttype - list accounts by account type. Valid account types are 1 (admi
      #       n), 2 (domain-admin), and 0 (user).
      #     domainid - list only resources belonging to the domain specified
      #     id - list account by account ID
      #     iscleanuprequired - list accounts by cleanuprequred attribute (values are tr
      #       ue or false)
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list account by account name
      #     page - 
      #     pagesize - 
      #     state - list accounts by state. Valid states are enabled, disabled, and lock
      #       ed.
      #     page - Pagination

      args.merge!('command' => 'listAccounts')

      return request(args)
  end
 

  def addAccountToProject(args={})
      # Adds acoount to a project
      # 
      # args - A dictionary. The following are options for keys:
      #     projectid - id of the project to add the account to
      #     account - name of the account to be added to the project
      #     email - email to which invitation to the project is going to be sent

      args.merge!('command' => 'addAccountToProject')
      if not args.has_key?('projectid')
          raise ArgumentError, "Missing required argument 'projectid'"
      end

      return request(args)
  end
 

  def deleteAccountFromProject(args={})
      # Deletes account from the project
      # 
      # args - A dictionary. The following are options for keys:
      #     account - name of the account to be removed from the project
      #     projectid - id of the project to remove the account from

      args.merge!('command' => 'deleteAccountFromProject')
      if not args.has_key?('account')
          raise ArgumentError, "Missing required argument 'account'"
      end
      if not args.has_key?('projectid')
          raise ArgumentError, "Missing required argument 'projectid'"
      end

      return request(args)
  end
 

  def listProjectAccounts(args={})
      # Lists project's accounts
      # 
      # args - A dictionary. The following are options for keys:
      #     projectid - id of the project
      #     account - list accounts of the project by account name
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     role - list accounts of the project by role
      #     page - Pagination

      args.merge!('command' => 'listProjectAccounts')
      if not args.has_key?('projectid')
          raise ArgumentError, "Missing required argument 'projectid'"
      end

      return request(args)
  end
 

  def attachVolume(args={})
      # Attaches a disk volume to a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the disk volume
      #     virtualmachineid - the ID of the virtual machine
      #     deviceid - the ID of the device to map the volume to within the guest OS. If
      #        no deviceId is passed in, the next available deviceId will be chosen. Possible 
      #       values for a Linux OS are:* 1 - /dev/xvdb* 2 - /dev/xvdc* 4 - /dev/xvde* 5 - /de
      #       v/xvdf* 6 - /dev/xvdg* 7 - /dev/xvdh* 8 - /dev/xvdi* 9 - /dev/xvdj

      args.merge!('command' => 'attachVolume')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def uploadVolume(args={})
      # Uploads a data disk.
      # 
      # args - A dictionary. The following are options for keys:
      #     format - the format for the volume. Possible values include QCOW2, OVA, and 
      #       VHD.
      #     name - the name of the volume
      #     url - the URL of where the volume is hosted. Possible URL include http:// an
      #       d https://
      #     zoneid - the ID of the zone the volume is to be hosted on
      #     account - an optional accountName. Must be used with domainId.
      #     checksum - the MD5 checksum value of this volume
      #     domainid - an optional domainId. If the account parameter is used, domainId 
      #       must also be used.

      args.merge!('command' => 'uploadVolume')
      if not args.has_key?('format')
          raise ArgumentError, "Missing required argument 'format'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def detachVolume(args={})
      # Detaches a disk volume from a virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     deviceid - the device ID on the virtual machine where volume is detached fro
      #       m
      #     id - the ID of the disk volume
      #     virtualmachineid - the ID of the virtual machine where the volume is detache
      #       d from

      args.merge!('command' => 'detachVolume')

      return request(args)
  end
 

  def createVolume(args={})
      # Creates a disk volume from a disk offering. This disk volume must still be attac
      # hed to a virtual machine to make use of it.
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name of the disk volume
      #     account - the account associated with the disk volume. Must be used with the
      #        domainId parameter.
      #     diskofferingid - the ID of the disk offering. Either diskOfferingId or snaps
      #       hotId must be passed in.
      #     domainid - the domain ID associated with the disk offering. If used with the
      #        account parameter returns the disk volume associated with the account for the s
      #       pecified domain.
      #     projectid - the project associated with the volume. Mutually exclusive with 
      #       account parameter
      #     size - Arbitrary volume size
      #     snapshotid - the snapshot ID for the disk volume. Either diskOfferingId or s
      #       napshotId must be passed in.
      #     zoneid - the ID of the availability zone

      args.merge!('command' => 'createVolume')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteVolume(args={})
      # Deletes a detached disk volume.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the disk volume

      args.merge!('command' => 'deleteVolume')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listVolumes(args={})
      # Lists all volumes.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     hostid - list volumes on specified host
      #     id - the ID of the disk volume
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - the name of the disk volume
      #     page - 
      #     pagesize - 
      #     podid - the pod id the disk volume belongs to
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     type - the type of disk volume
      #     virtualmachineid - the ID of the virtual machine
      #     zoneid - the ID of the availability zone
      #     page - Pagination

      args.merge!('command' => 'listVolumes')

      return request(args)
  end
 

  def extractVolume(args={})
      # Extracts volume
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the volume
      #     mode - the mode of extraction - HTTP_DOWNLOAD or FTP_UPLOAD
      #     zoneid - the ID of the zone where the volume is located
      #     url - the url to which the volume would be extracted

      args.merge!('command' => 'extractVolume')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('mode')
          raise ArgumentError, "Missing required argument 'mode'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def migrateVolume(args={})
      # Migrate volume
      # 
      # args - A dictionary. The following are options for keys:
      #     storageid - destination storage pool ID to migrate the volume to
      #     volumeid - the ID of the volume

      args.merge!('command' => 'migrateVolume')
      if not args.has_key?('storageid')
          raise ArgumentError, "Missing required argument 'storageid'"
      end
      if not args.has_key?('volumeid')
          raise ArgumentError, "Missing required argument 'volumeid'"
      end

      return request(args)
  end
 

  def startSystemVm(args={})
      # Starts a system virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the system virtual machine

      args.merge!('command' => 'startSystemVm')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def rebootSystemVm(args={})
      # Reboots a system VM.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the system virtual machine

      args.merge!('command' => 'rebootSystemVm')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def stopSystemVm(args={})
      # Stops a system VM.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the system virtual machine
      #     forced - Force stop the VM.  The caller knows the VM is stopped.

      args.merge!('command' => 'stopSystemVm')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def destroySystemVm(args={})
      # Destroyes a system virtual machine.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the system virtual machine

      args.merge!('command' => 'destroySystemVm')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listSystemVms(args={})
      # List system virtual machines.
      # 
      # args - A dictionary. The following are options for keys:
      #     hostid - the host ID of the system VM
      #     id - the ID of the system VM
      #     keyword - List by keyword
      #     name - the name of the system VM
      #     page - 
      #     pagesize - 
      #     podid - the Pod ID of the system VM
      #     state - the state of the system VM
      #     storageid - the storage ID where vm's volumes belong to
      #     systemvmtype - the system VM type. Possible types are "consoleproxy" and "se
      #       condarystoragevm".
      #     zoneid - the Zone ID of the system VM
      #     page - Pagination

      args.merge!('command' => 'listSystemVms')

      return request(args)
  end
 

  def migrateSystemVm(args={})
      # Attempts Migration of a system virtual machine to the host specified.
      # 
      # args - A dictionary. The following are options for keys:
      #     hostid - destination Host ID to migrate VM to
      #     virtualmachineid - the ID of the virtual machine

      args.merge!('command' => 'migrateSystemVm')
      if not args.has_key?('hostid')
          raise ArgumentError, "Missing required argument 'hostid'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def changeServiceForSystemVm(args={})
      # Changes the service offering for a system vm (console proxy or secondary storage
      # ). The system vm must be in a "Stopped" state for this command to take effect.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the system vm
      #     serviceofferingid - the service offering ID to apply to the system vm

      args.merge!('command' => 'changeServiceForSystemVm')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end
      if not args.has_key?('serviceofferingid')
          raise ArgumentError, "Missing required argument 'serviceofferingid'"
      end

      return request(args)
  end
 

  def createSecurityGroup(args={})
      # Creates a security group
      # 
      # args - A dictionary. The following are options for keys:
      #     name - name of the security group
      #     account - an optional account for the security group. Must be used with doma
      #       inId.
      #     description - the description of the security group
      #     domainid - an optional domainId for the security group. If the account param
      #       eter is used, domainId must also be used.
      #     projectid - Deploy vm for the project

      args.merge!('command' => 'createSecurityGroup')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteSecurityGroup(args={})
      # Deletes security group
      # 
      # args - A dictionary. The following are options for keys:
      #     account - the account of the security group. Must be specified with domain I
      #       D
      #     domainid - the domain ID of account owning the security group
      #     id - The ID of the security group. Mutually exclusive with name parameter
      #     name - The ID of the security group. Mutually exclusive with id parameter
      #     projectid - the project of the security group

      args.merge!('command' => 'deleteSecurityGroup')

      return request(args)
  end
 

  def authorizeSecurityGroupIngress(args={})
      # Authorizes a particular ingress rule for this security group
      # 
      # args - A dictionary. The following are options for keys:
      #     account - an optional account for the security group. Must be used with doma
      #       inId.
      #     cidrlist - the cidr list associated
      #     domainid - an optional domainId for the security group. If the account param
      #       eter is used, domainId must also be used.
      #     endport - end port for this ingress rule
      #     icmpcode - error code for this icmp message
      #     icmptype - type of the icmp message being sent
      #     projectid - an optional project of the security group
      #     protocol - TCP is default. UDP is the other supported protocol
      #     securitygroupid - The ID of the security group. Mutually exclusive with secu
      #       rityGroupName parameter
      #     securitygroupname - The name of the security group. Mutually exclusive with 
      #       securityGroupName parameter
      #     startport - start port for this ingress rule
      #     usersecuritygrouplist - user to security group mapping

      args.merge!('command' => 'authorizeSecurityGroupIngress')

      return request(args)
  end
 

  def revokeSecurityGroupIngress(args={})
      # Deletes a particular ingress rule from this security group
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the ingress rule

      args.merge!('command' => 'revokeSecurityGroupIngress')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def authorizeSecurityGroupEgress(args={})
      # Authorizes a particular egress rule for this security group
      # 
      # args - A dictionary. The following are options for keys:
      #     account - an optional account for the security group. Must be used with doma
      #       inId.
      #     cidrlist - the cidr list associated
      #     domainid - an optional domainId for the security group. If the account param
      #       eter is used, domainId must also be used.
      #     endport - end port for this egress rule
      #     icmpcode - error code for this icmp message
      #     icmptype - type of the icmp message being sent
      #     projectid - an optional project of the security group
      #     protocol - TCP is default. UDP is the other supported protocol
      #     securitygroupid - The ID of the security group. Mutually exclusive with secu
      #       rityGroupName parameter
      #     securitygroupname - The name of the security group. Mutually exclusive with 
      #       securityGroupName parameter
      #     startport - start port for this egress rule
      #     usersecuritygrouplist - user to security group mapping

      args.merge!('command' => 'authorizeSecurityGroupEgress')

      return request(args)
  end
 

  def revokeSecurityGroupEgress(args={})
      # Deletes a particular egress rule from this security group
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the egress rule

      args.merge!('command' => 'revokeSecurityGroupEgress')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listSecurityGroups(args={})
      # Lists security groups
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - list the security group by the id provided
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     securitygroupname - lists security groups by name
      #     tags - List resources by tags (key/value pairs)
      #     virtualmachineid - lists security groups by virtual machine id
      #     page - Pagination

      args.merge!('command' => 'listSecurityGroups')

      return request(args)
  end
 

  def listStoragePools(args={})
      # Lists storage pools.
      # 
      # args - A dictionary. The following are options for keys:
      #     clusterid - list storage pools belongig to the specific cluster
      #     id - the ID of the storage pool
      #     ipaddress - the IP address for the storage pool
      #     keyword - List by keyword
      #     name - the name of the storage pool
      #     page - 
      #     pagesize - 
      #     path - the storage pool path
      #     podid - the Pod ID for the storage pool
      #     zoneid - the Zone ID for the storage pool
      #     page - Pagination

      args.merge!('command' => 'listStoragePools')

      return request(args)
  end
 

  def createStoragePool(args={})
      # Creates a storage pool.
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name for the storage pool
      #     url - the URL of the storage pool
      #     zoneid - the Zone ID for the storage pool
      #     clusterid - the cluster ID for the storage pool
      #     details - the details for the storage pool
      #     podid - the Pod ID for the storage pool
      #     tags - the tags for the storage pool

      args.merge!('command' => 'createStoragePool')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def updateStoragePool(args={})
      # Updates a storage pool.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the Id of the storage pool
      #     tags - comma-separated list of tags for the storage pool

      args.merge!('command' => 'updateStoragePool')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteStoragePool(args={})
      # Deletes a storage pool.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Storage pool id
      #     forced - Force destroy storage pool (force expunge volumes in Destroyed stat
      #       e as a part of pool removal)

      args.merge!('command' => 'deleteStoragePool')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def enableStorageMaintenance(args={})
      # Puts storage pool into maintenance state
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Primary storage ID

      args.merge!('command' => 'enableStorageMaintenance')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def cancelStorageMaintenance(args={})
      # Cancels maintenance for primary storage
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the primary storage ID

      args.merge!('command' => 'cancelStorageMaintenance')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createSnapshot(args={})
      # Creates an instant snapshot of a volume.
      # 
      # args - A dictionary. The following are options for keys:
      #     volumeid - The ID of the disk volume
      #     account - The account of the snapshot. The account parameter must be used wi
      #       th the domainId parameter.
      #     domainid - The domain ID of the snapshot. If used with the account parameter
      #       , specifies a domain for the account associated with the disk volume.
      #     policyid - policy id of the snapshot, if this is null, then use MANUAL_POLIC
      #       Y.

      args.merge!('command' => 'createSnapshot')
      if not args.has_key?('volumeid')
          raise ArgumentError, "Missing required argument 'volumeid'"
      end

      return request(args)
  end
 

  def listSnapshots(args={})
      # Lists all available snapshots for the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - lists snapshot by snapshot ID
      #     intervaltype - valid values are HOURLY, DAILY, WEEKLY, and MONTHLY.
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - lists snapshot by snapshot name
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     snapshottype - valid values are MANUAL or RECURRING.
      #     tags - List resources by tags (key/value pairs)
      #     volumeid - the ID of the disk volume
      #     page - Pagination

      args.merge!('command' => 'listSnapshots')

      return request(args)
  end
 

  def deleteSnapshot(args={})
      # Deletes a snapshot of a disk volume.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - The ID of the snapshot

      args.merge!('command' => 'deleteSnapshot')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createSnapshotPolicy(args={})
      # Creates a snapshot policy for the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     intervaltype - valid values are HOURLY, DAILY, WEEKLY, and MONTHLY
      #     maxsnaps - maximum number of snapshots to retain
      #     schedule - time the snapshot is scheduled to be taken. Format is:* if HOURLY
      #       , MM* if DAILY, MM:HH* if WEEKLY, MM:HH:DD (1-7)* if MONTHLY, MM:HH:DD (1-28)
      #     timezone - Specifies a timezone for this command. For more information on th
      #       e timezone parameter, see Time Zone Format.
      #     volumeid - the ID of the disk volume

      args.merge!('command' => 'createSnapshotPolicy')
      if not args.has_key?('intervaltype')
          raise ArgumentError, "Missing required argument 'intervaltype'"
      end
      if not args.has_key?('maxsnaps')
          raise ArgumentError, "Missing required argument 'maxsnaps'"
      end
      if not args.has_key?('schedule')
          raise ArgumentError, "Missing required argument 'schedule'"
      end
      if not args.has_key?('timezone')
          raise ArgumentError, "Missing required argument 'timezone'"
      end
      if not args.has_key?('volumeid')
          raise ArgumentError, "Missing required argument 'volumeid'"
      end

      return request(args)
  end
 

  def deleteSnapshotPolicies(args={})
      # Deletes snapshot policies for the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the Id of the snapshot policy
      #     ids - list of snapshots policy IDs separated by comma

      args.merge!('command' => 'deleteSnapshotPolicies')

      return request(args)
  end
 

  def listSnapshotPolicies(args={})
      # Lists snapshot policies.
      # 
      # args - A dictionary. The following are options for keys:
      #     volumeid - the ID of the disk volume
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listSnapshotPolicies')
      if not args.has_key?('volumeid')
          raise ArgumentError, "Missing required argument 'volumeid'"
      end

      return request(args)
  end
 

  def listPortForwardingRules(args={})
      # Lists all port forwarding rules for an IP address.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - Lists rule with the specified ID.
      #     ipaddressid - the id of IP address of the port forwarding services
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     page - Pagination

      args.merge!('command' => 'listPortForwardingRules')

      return request(args)
  end
 

  def createPortForwardingRule(args={})
      # Creates a port forwarding rule
      # 
      # args - A dictionary. The following are options for keys:
      #     ipaddressid - the IP address id of the port forwarding rule
      #     privateport - the starting port of port forwarding rule's private port range
      #       
      #     protocol - the protocol for the port fowarding rule. Valid values are TCP or
      #        UDP.
      #     publicport - the starting port of port forwarding rule's public port range
      #     virtualmachineid - the ID of the virtual machine for the port forwarding rul
      #       e
      #     cidrlist - the cidr list to forward traffic from
      #     networkid - The network of the vm the Port Forwarding rule will be created f
      #       or. Required when public Ip address is not associated with any Guest network yet
      #        (VPC case)
      #     openfirewall - if true, firewall rule for source/end pubic port is automatic
      #       ally created; if false - firewall rule has to be created explicitely. If not spe
      #       cified 1) defaulted to false when PF rule is being created for VPC guest network
      #        2) in all other cases defaulted to true
      #     privateendport - the ending port of port forwarding rule's private port rang
      #       e
      #     publicendport - the ending port of port forwarding rule's private port range
      #       

      args.merge!('command' => 'createPortForwardingRule')
      if not args.has_key?('ipaddressid')
          raise ArgumentError, "Missing required argument 'ipaddressid'"
      end
      if not args.has_key?('privateport')
          raise ArgumentError, "Missing required argument 'privateport'"
      end
      if not args.has_key?('protocol')
          raise ArgumentError, "Missing required argument 'protocol'"
      end
      if not args.has_key?('publicport')
          raise ArgumentError, "Missing required argument 'publicport'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def deletePortForwardingRule(args={})
      # Deletes a port forwarding rule
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the port forwarding rule

      args.merge!('command' => 'deletePortForwardingRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def createFirewallRule(args={})
      # Creates a firewall rule for a given ip address
      # 
      # args - A dictionary. The following are options for keys:
      #     ipaddressid - the IP address id of the port forwarding rule
      #     protocol - the protocol for the firewall rule. Valid values are TCP/UDP/ICMP
      #       .
      #     cidrlist - the cidr list to forward traffic from
      #     endport - the ending port of firewall rule
      #     icmpcode - error code for this icmp message
      #     icmptype - type of the icmp message being sent
      #     startport - the starting port of firewall rule
      #     type - type of firewallrule: system/user

      args.merge!('command' => 'createFirewallRule')
      if not args.has_key?('ipaddressid')
          raise ArgumentError, "Missing required argument 'ipaddressid'"
      end
      if not args.has_key?('protocol')
          raise ArgumentError, "Missing required argument 'protocol'"
      end

      return request(args)
  end
 

  def deleteFirewallRule(args={})
      # Deletes a firewall rule
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the firewall rule

      args.merge!('command' => 'deleteFirewallRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listFirewallRules(args={})
      # Lists all firewall rules for an IP address.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - Lists rule with the specified ID.
      #     ipaddressid - the id of IP address of the firwall services
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     page - Pagination

      args.merge!('command' => 'listFirewallRules')

      return request(args)
  end
 

  def markDefaultZoneForAccount(args={})
      # Marks a default zone for this account
      # 
      # args - A dictionary. The following are options for keys:
      #     account - Name of the account that is to be marked.
      #     domainid - Marks the account that belongs to the specified domain.
      #     zoneid - The Zone ID with which the account is to be marked.

      args.merge!('command' => 'markDefaultZoneForAccount')
      if not args.has_key?('account')
          raise ArgumentError, "Missing required argument 'account'"
      end
      if not args.has_key?('domainid')
          raise ArgumentError, "Missing required argument 'domainid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def createZone(args={})
      # Creates a Zone.
      # 
      # args - A dictionary. The following are options for keys:
      #     dns1 - the first DNS for the Zone
      #     internaldns1 - the first internal DNS for the Zone
      #     name - the name of the Zone
      #     networktype - network type of the zone, can be Basic or Advanced
      #     allocationstate - Allocation state of this Zone for allocation of new resour
      #       ces
      #     dns2 - the second DNS for the Zone
      #     domain - Network domain name for the networks in the zone
      #     domainid - the ID of the containing domain, null for public zones
      #     guestcidraddress - the guest CIDR address for the Zone
      #     internaldns2 - the second internal DNS for the Zone
      #     localstorageenabled - true if local storage offering enabled, false otherwis
      #       e
      #     securitygroupenabled - true if network is security group enabled, false othe
      #       rwise

      args.merge!('command' => 'createZone')
      if not args.has_key?('dns1')
          raise ArgumentError, "Missing required argument 'dns1'"
      end
      if not args.has_key?('internaldns1')
          raise ArgumentError, "Missing required argument 'internaldns1'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('networktype')
          raise ArgumentError, "Missing required argument 'networktype'"
      end

      return request(args)
  end
 

  def updateZone(args={})
      # Updates a Zone.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Zone
      #     allocationstate - Allocation state of this cluster for allocation of new res
      #       ources
      #     details - the details for the Zone
      #     dhcpprovider - the dhcp Provider for the Zone
      #     dns1 - the first DNS for the Zone
      #     dns2 - the second DNS for the Zone
      #     dnssearchorder - the dns search order list
      #     domain - Network domain name for the networks in the zone; empty string will
      #        update domain with NULL value
      #     guestcidraddress - the guest CIDR address for the Zone
      #     internaldns1 - the first internal DNS for the Zone
      #     internaldns2 - the second internal DNS for the Zone
      #     ispublic - updates a private zone to public if set, but not vice-versa
      #     localstorageenabled - true if local storage offering enabled, false otherwis
      #       e
      #     name - the name of the Zone

      args.merge!('command' => 'updateZone')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteZone(args={})
      # Deletes a Zone.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Zone

      args.merge!('command' => 'deleteZone')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listZones(args={})
      # Lists zones
      # 
      # args - A dictionary. The following are options for keys:
      #     available - true if you want to retrieve all available Zones. False if you o
      #       nly want to return the Zones from which you have at least one VM. Default is fal
      #       se.
      #     domainid - the ID of the domain associated with the zone
      #     id - the ID of the zone
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     showcapacities - flag to display the capacity of the zones
      #     page - Pagination

      args.merge!('command' => 'listZones')

      return request(args)
  end
 

  def enableStaticNat(args={})
      # Enables static nat for given ip address
      # 
      # args - A dictionary. The following are options for keys:
      #     ipaddressid - the public IP address id for which static nat feature is being
      #        enabled
      #     virtualmachineid - the ID of the virtual machine for enabling static nat fea
      #       ture
      #     networkid - The network of the vm the static nat will be enabled for. Requir
      #       ed when public Ip address is not associated with any Guest network yet (VPC case
      #       )

      args.merge!('command' => 'enableStaticNat')
      if not args.has_key?('ipaddressid')
          raise ArgumentError, "Missing required argument 'ipaddressid'"
      end
      if not args.has_key?('virtualmachineid')
          raise ArgumentError, "Missing required argument 'virtualmachineid'"
      end

      return request(args)
  end
 

  def createIpForwardingRule(args={})
      # Creates an ip forwarding rule
      # 
      # args - A dictionary. The following are options for keys:
      #     ipaddressid - the public IP address id of the forwarding rule, already assoc
      #       iated via associateIp
      #     protocol - the protocol for the rule. Valid values are TCP or UDP.
      #     startport - the start port for the rule
      #     cidrlist - the cidr list to forward traffic from
      #     endport - the end port for the rule
      #     openfirewall - if true, firewall rule for source/end pubic port is automatic
      #       ally created; if false - firewall rule has to be created explicitely. Has value 
      #       true by default

      args.merge!('command' => 'createIpForwardingRule')
      if not args.has_key?('ipaddressid')
          raise ArgumentError, "Missing required argument 'ipaddressid'"
      end
      if not args.has_key?('protocol')
          raise ArgumentError, "Missing required argument 'protocol'"
      end
      if not args.has_key?('startport')
          raise ArgumentError, "Missing required argument 'startport'"
      end

      return request(args)
  end
 

  def deleteIpForwardingRule(args={})
      # Deletes an ip forwarding rule
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the forwarding rule

      args.merge!('command' => 'deleteIpForwardingRule')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listIpForwardingRules(args={})
      # List the ip forwarding rules
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - Lists rule with the specified ID.
      #     ipaddressid - list the rule belonging to this public ip address
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     virtualmachineid - Lists all rules applied to the specified Vm.
      #     page - Pagination

      args.merge!('command' => 'listIpForwardingRules')

      return request(args)
  end
 

  def disableStaticNat(args={})
      # Disables static rule for given ip address
      # 
      # args - A dictionary. The following are options for keys:
      #     ipaddressid - the public IP address id for which static nat feature is being
      #        disableed

      args.merge!('command' => 'disableStaticNat')
      if not args.has_key?('ipaddressid')
          raise ArgumentError, "Missing required argument 'ipaddressid'"
      end

      return request(args)
  end
 

  def createDomain(args={})
      # Creates a domain
      # 
      # args - A dictionary. The following are options for keys:
      #     name - creates domain with this name
      #     networkdomain - Network domain for networks in the domain
      #     parentdomainid - assigns new domain a parent domain by domain ID of the pare
      #       nt.  If no parent domain is specied, the ROOT domain is assumed.

      args.merge!('command' => 'createDomain')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def updateDomain(args={})
      # Updates a domain with a new name
      # 
      # args - A dictionary. The following are options for keys:
      #     id - ID of domain to update
      #     name - updates domain with this name
      #     networkdomain - Network domain for the domain's networks; empty string will 
      #       update domainName with NULL value

      args.merge!('command' => 'updateDomain')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteDomain(args={})
      # Deletes a specified domain
      # 
      # args - A dictionary. The following are options for keys:
      #     id - ID of domain to delete
      #     cleanup - true if all domain resources (child domains, accounts) have to be 
      #       cleaned up, false otherwise

      args.merge!('command' => 'deleteDomain')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listDomains(args={})
      # Lists domains and provides detailed information for listed domains
      # 
      # args - A dictionary. The following are options for keys:
      #     id - List domain by domain ID.
      #     keyword - List by keyword
      #     level - List domains by domain level.
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - List domain by domain name.
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listDomains')

      return request(args)
  end
 

  def listDomainChildren(args={})
      # Lists all children domains belonging to a specified domain
      # 
      # args - A dictionary. The following are options for keys:
      #     id - list children domain by parent domain ID.
      #     isrecursive - to return the entire tree, use the value "true". To return the
      #        first level children, use the value "false".
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list children domains by name
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listDomainChildren')

      return request(args)
  end
 

  def updateConfiguration(args={})
      # Updates a configuration.
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name of the configuration
      #     value - the value of the configuration

      args.merge!('command' => 'updateConfiguration')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def listConfigurations(args={})
      # Lists all configurations.
      # 
      # args - A dictionary. The following are options for keys:
      #     category - lists configurations by category
      #     keyword - List by keyword
      #     name - lists configuration by name
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listConfigurations')

      return request(args)
  end
 

  def listCapabilities(args={})
      # Lists capabilities
      # 
      # args - A dictionary. The following are options for keys:
      #     page - Pagination

      args.merge!('command' => 'listCapabilities')

      return request(args)
  end
 

  def updateHypervisorCapabilities(args={})
      # Updates a hypervisor capabilities.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - ID of the hypervisor capability
      #     maxguestslimit - the max number of Guest VMs per host for this hypervisor.
      #     securitygroupenabled - set true to enable security group for this hypervisor
      #       .

      args.merge!('command' => 'updateHypervisorCapabilities')

      return request(args)
  end
 

  def listHypervisorCapabilities(args={})
      # Lists all hypervisor capabilities.
      # 
      # args - A dictionary. The following are options for keys:
      #     hypervisor - the hypervisor for which to restrict the search
      #     id - ID of the hypervisor capability
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listHypervisorCapabilities')

      return request(args)
  end
 

  def createInstanceGroup(args={})
      # Creates a vm group
      # 
      # args - A dictionary. The following are options for keys:
      #     name - the name of the instance group
      #     account - the account of the instance group. The account parameter must be u
      #       sed with the domainId parameter.
      #     domainid - the domain ID of account owning the instance group
      #     projectid - The project of the instance group

      args.merge!('command' => 'createInstanceGroup')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteInstanceGroup(args={})
      # Deletes a vm group
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the instance group

      args.merge!('command' => 'deleteInstanceGroup')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateInstanceGroup(args={})
      # Updates a vm group
      # 
      # args - A dictionary. The following are options for keys:
      #     id - Instance group ID
      #     name - new instance group name

      args.merge!('command' => 'updateInstanceGroup')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listInstanceGroups(args={})
      # Lists vm groups
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - list instance groups by ID
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - list instance groups by name
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     page - Pagination

      args.merge!('command' => 'listInstanceGroups')

      return request(args)
  end
 

  def createServiceOffering(args={})
      # Creates a service offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     cpunumber - the CPU number of the service offering
      #     cpuspeed - the CPU speed of the service offering in MHz.
      #     displaytext - the display text of the service offering
      #     memory - the total memory of the service offering in MB
      #     name - the name of the service offering
      #     domainid - the ID of the containing domain, null for public offerings
      #     hosttags - the host tag for this service offering.
      #     issystem - is this a system vm offering
      #     limitcpuuse - restrict the CPU usage to committed service offering
      #     networkrate - data transfer rate in megabits per second allowed. Supported o
      #       nly for non-System offering and system offerings having "domainrouter" systemvmt
      #       ype
      #     offerha - the HA for the service offering
      #     storagetype - the storage type of the service offering. Values are local and
      #        shared.
      #     systemvmtype - the system VM type. Possible types are "domainrouter", "conso
      #       leproxy" and "secondarystoragevm".
      #     tags - the tags for this service offering.

      args.merge!('command' => 'createServiceOffering')
      if not args.has_key?('cpunumber')
          raise ArgumentError, "Missing required argument 'cpunumber'"
      end
      if not args.has_key?('cpuspeed')
          raise ArgumentError, "Missing required argument 'cpuspeed'"
      end
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('memory')
          raise ArgumentError, "Missing required argument 'memory'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteServiceOffering(args={})
      # Deletes a service offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the service offering

      args.merge!('command' => 'deleteServiceOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateServiceOffering(args={})
      # Updates a service offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the service offering to be updated
      #     displaytext - the display text of the service offering to be updated
      #     name - the name of the service offering to be updated
      #     sortkey - sort key of the service offering, integer

      args.merge!('command' => 'updateServiceOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listServiceOfferings(args={})
      # Lists all available service offerings.
      # 
      # args - A dictionary. The following are options for keys:
      #     domainid - the ID of the domain associated with the service offering
      #     id - ID of the service offering
      #     issystem - is this a system vm offering
      #     keyword - List by keyword
      #     name - name of the service offering
      #     page - 
      #     pagesize - 
      #     systemvmtype - the system VM type. Possible types are "consoleproxy", "secon
      #       darystoragevm" or "domainrouter".
      #     virtualmachineid - the ID of the virtual machine. Pass this in if you want t
      #       o see the available service offering that a virtual machine can be changed to.
      #     page - Pagination

      args.merge!('command' => 'listServiceOfferings')

      return request(args)
  end
 

  def registerTemplate(args={})
      # Registers an existing template into the CloudStack cloud.
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the template. This is usually used for dis
      #       play purposes.
      #     format - the format for the template. Possible values include QCOW2, RAW, an
      #       d VHD.
      #     hypervisor - the target hypervisor for the template
      #     name - the name of the template
      #     ostypeid - the ID of the OS Type that best represents the OS of this templat
      #       e.
      #     url - the URL of where the template is hosted. Possible URL include http:// 
      #       and https://
      #     zoneid - the ID of the zone the template is to be hosted on
      #     account - an optional accountName. Must be used with domainId.
      #     bits - 32 or 64 bits support. 64 by default
      #     checksum - the MD5 checksum value of this template
      #     details - Template details in key/value pairs.
      #     domainid - an optional domainId. If the account parameter is used, domainId 
      #       must also be used.
      #     isextractable - true if the template or its derivatives are extractable; def
      #       ault is false
      #     isfeatured - true if this template is a featured template, false otherwise
      #     ispublic - true if the template is available to all accounts; default is tru
      #       e
      #     passwordenabled - true if the template supports the password reset feature; 
      #       default is false
      #     projectid - Register template for the project
      #     requireshvm - true if this template requires HVM
      #     sshkeyenabled - true if the template supports the sshkey upload feature; def
      #       ault is false
      #     templatetag - the tag for this template.

      args.merge!('command' => 'registerTemplate')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('format')
          raise ArgumentError, "Missing required argument 'format'"
      end
      if not args.has_key?('hypervisor')
          raise ArgumentError, "Missing required argument 'hypervisor'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('ostypeid')
          raise ArgumentError, "Missing required argument 'ostypeid'"
      end
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def registerIso(args={})
      # Registers an existing ISO into the CloudStack Cloud.
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - the display text of the ISO. This is usually used for display 
      #       purposes.
      #     name - the name of the ISO
      #     url - the URL to where the ISO is currently being hosted
      #     zoneid - the ID of the zone you wish to register the ISO to.
      #     account - an optional account name. Must be used with domainId.
      #     bootable - true if this ISO is bootable. If not passed explicitly its assume
      #       d to be true
      #     checksum - the MD5 checksum value of this ISO
      #     domainid - an optional domainId. If the account parameter is used, domainId 
      #       must also be used.
      #     isextractable - true if the iso or its derivatives are extractable; default 
      #       is false
      #     isfeatured - true if you want this ISO to be featured
      #     ispublic - true if you want to register the ISO to be publicly available to 
      #       all users, false otherwise.
      #     ostypeid - the ID of the OS Type that best represents the OS of this ISO. If
      #        the iso is bootable this parameter needs to be passed
      #     projectid - Register iso for the project

      args.merge!('command' => 'registerIso')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def registerUserKeys(args={})
      # This command allows a user to register for the developer API, returning a secret
      #  key and an API key. This request is made through the integration API port, so i
      # t is a privileged command and must be made on behalf of a user. It is up to the 
      # implementer just how the username and password are entered, and then how that tr
      # anslates to an integration API request. Both secret key and API key should be re
      # turned to the user
      # 
      # args - A dictionary. The following are options for keys:
      #     id - User id

      args.merge!('command' => 'registerUserKeys')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def registerSSHKeyPair(args={})
      # Register a public key in a keypair under a certain name
      # 
      # args - A dictionary. The following are options for keys:
      #     name - Name of the keypair
      #     publickey - Public key material of the keypair
      #     account - an optional account for the ssh key. Must be used with domainId.
      #     domainid - an optional domainId for the ssh key. If the account parameter is
      #        used, domainId must also be used.
      #     projectid - an optional project for the ssh key

      args.merge!('command' => 'registerSSHKeyPair')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('publickey')
          raise ArgumentError, "Missing required argument 'publickey'"
      end

      return request(args)
  end
 

  def createPod(args={})
      # Creates a new Pod.
      # 
      # args - A dictionary. The following are options for keys:
      #     gateway - the gateway for the Pod
      #     name - the name of the Pod
      #     netmask - the netmask for the Pod
      #     startip - the starting IP address for the Pod
      #     zoneid - the Zone ID in which the Pod will be created
      #     allocationstate - Allocation state of this Pod for allocation of new resourc
      #       es
      #     endip - the ending IP address for the Pod

      args.merge!('command' => 'createPod')
      if not args.has_key?('gateway')
          raise ArgumentError, "Missing required argument 'gateway'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end
      if not args.has_key?('netmask')
          raise ArgumentError, "Missing required argument 'netmask'"
      end
      if not args.has_key?('startip')
          raise ArgumentError, "Missing required argument 'startip'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def updatePod(args={})
      # Updates a Pod.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Pod
      #     allocationstate - Allocation state of this cluster for allocation of new res
      #       ources
      #     endip - the ending IP address for the Pod
      #     gateway - the gateway for the Pod
      #     name - the name of the Pod
      #     netmask - the netmask of the Pod
      #     startip - the starting IP address for the Pod

      args.merge!('command' => 'updatePod')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deletePod(args={})
      # Deletes a Pod.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Pod

      args.merge!('command' => 'deletePod')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listPods(args={})
      # Lists all Pods.
      # 
      # args - A dictionary. The following are options for keys:
      #     allocationstate - list pods by allocation state
      #     id - list Pods by ID
      #     keyword - List by keyword
      #     name - list Pods by name
      #     page - 
      #     pagesize - 
      #     showcapacities - flag to display the capacity of the pods
      #     zoneid - list Pods by Zone ID
      #     page - Pagination

      args.merge!('command' => 'listPods')

      return request(args)
  end
 

  def createDiskOffering(args={})
      # Creates a disk offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     displaytext - alternate display text of the disk offering
      #     name - name of the disk offering
      #     customized - whether disk offering is custom or not
      #     disksize - size of the disk offering in GB
      #     domainid - the ID of the containing domain, null for public offerings
      #     storagetype - the storage type of the disk offering. Values are local and sh
      #       ared.
      #     tags - tags for the disk offering

      args.merge!('command' => 'createDiskOffering')
      if not args.has_key?('displaytext')
          raise ArgumentError, "Missing required argument 'displaytext'"
      end
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def updateDiskOffering(args={})
      # Updates a disk offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - ID of the disk offering
      #     displaytext - updates alternate display text of the disk offering with this 
      #       value
      #     name - updates name of the disk offering with this value
      #     sortkey - sort key of the disk offering, integer

      args.merge!('command' => 'updateDiskOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def deleteDiskOffering(args={})
      # Updates a disk offering.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - ID of the disk offering

      args.merge!('command' => 'deleteDiskOffering')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listDiskOfferings(args={})
      # Lists all available disk offerings.
      # 
      # args - A dictionary. The following are options for keys:
      #     domainid - the ID of the domain of the disk offering.
      #     id - ID of the disk offering
      #     keyword - List by keyword
      #     name - name of the disk offering
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listDiskOfferings')

      return request(args)
  end
 

  def addCluster(args={})
      # Adds a new cluster
      # 
      # args - A dictionary. The following are options for keys:
      #     clustername - the cluster name
      #     clustertype - type of the cluster: CloudManaged, ExternalManaged
      #     hypervisor - hypervisor type of the cluster: XenServer,KVM,VMware,Hyperv,Bar
      #       eMetal,Simulator
      #     podid - the Pod ID for the host
      #     zoneid - the Zone ID for the cluster
      #     allocationstate - Allocation state of this cluster for allocation of new res
      #       ources
      #     password - the password for the host
      #     url - the URL
      #     username - the username for the cluster
      #     vsmipaddress - the ipaddress of the VSM associated with this cluster
      #     vsmpassword - the password for the VSM associated with this cluster
      #     vsmusername - the username for the VSM associated with this cluster

      args.merge!('command' => 'addCluster')
      if not args.has_key?('clustername')
          raise ArgumentError, "Missing required argument 'clustername'"
      end
      if not args.has_key?('clustertype')
          raise ArgumentError, "Missing required argument 'clustertype'"
      end
      if not args.has_key?('hypervisor')
          raise ArgumentError, "Missing required argument 'hypervisor'"
      end
      if not args.has_key?('podid')
          raise ArgumentError, "Missing required argument 'podid'"
      end
      if not args.has_key?('zoneid')
          raise ArgumentError, "Missing required argument 'zoneid'"
      end

      return request(args)
  end
 

  def deleteCluster(args={})
      # Deletes a cluster.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the cluster ID

      args.merge!('command' => 'deleteCluster')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def updateCluster(args={})
      # Updates an existing cluster
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the Cluster
      #     allocationstate - Allocation state of this cluster for allocation of new res
      #       ources
      #     clustername - the cluster name
      #     clustertype - hypervisor type of the cluster
      #     hypervisor - hypervisor type of the cluster
      #     managedstate - whether this cluster is managed by cloudstack

      args.merge!('command' => 'updateCluster')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listClusters(args={})
      # Lists clusters.
      # 
      # args - A dictionary. The following are options for keys:
      #     allocationstate - lists clusters by allocation state
      #     clustertype - lists clusters by cluster type
      #     hypervisor - lists clusters by hypervisor type
      #     id - lists clusters by the cluster ID
      #     keyword - List by keyword
      #     managedstate - whether this cluster is managed by cloudstack
      #     name - lists clusters by the cluster name
      #     page - 
      #     pagesize - 
      #     podid - lists clusters by Pod ID
      #     showcapacities - flag to display the capacity of the clusters
      #     zoneid - lists clusters by Zone ID
      #     page - Pagination

      args.merge!('command' => 'listClusters')

      return request(args)
  end
 

  def createVlanIpRange(args={})
      # Creates a VLAN IP range.
      # 
      # args - A dictionary. The following are options for keys:
      #     startip - the beginning IP address in the VLAN IP range
      #     account - account who will own the VLAN. If VLAN is Zone wide, this paramete
      #       r should be ommited
      #     domainid - domain ID of the account owning a VLAN
      #     endip - the ending IP address in the VLAN IP range
      #     forvirtualnetwork - true if VLAN is of Virtual type, false if Direct
      #     gateway - the gateway of the VLAN IP range
      #     netmask - the netmask of the VLAN IP range
      #     networkid - the network id
      #     physicalnetworkid - the physical network id
      #     podid - optional parameter. Have to be specified for Direct Untagged vlan on
      #       ly.
      #     projectid - project who will own the VLAN. If VLAN is Zone wide, this parame
      #       ter should be ommited
      #     vlan - the ID or VID of the VLAN. If not specified, will be defaulted to the
      #        vlan of the network or if vlan of the network is null - to Untagged
      #     zoneid - the Zone ID of the VLAN IP range

      args.merge!('command' => 'createVlanIpRange')
      if not args.has_key?('startip')
          raise ArgumentError, "Missing required argument 'startip'"
      end

      return request(args)
  end
 

  def deleteVlanIpRange(args={})
      # Creates a VLAN IP range.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the VLAN IP range

      args.merge!('command' => 'deleteVlanIpRange')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listVlanIpRanges(args={})
      # Lists all VLAN IP ranges.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - the account with which the VLAN IP range is associated. Must be us
      #       ed with the domainId parameter.
      #     domainid - the domain ID with which the VLAN IP range is associated.  If use
      #       d with the account parameter, returns all VLAN IP ranges for that account in the
      #        specified domain.
      #     forvirtualnetwork - true if VLAN is of Virtual type, false if Direct
      #     id - the ID of the VLAN IP range
      #     keyword - List by keyword
      #     networkid - network id of the VLAN IP range
      #     page - 
      #     pagesize - 
      #     physicalnetworkid - physical network id of the VLAN IP range
      #     podid - the Pod ID of the VLAN IP range
      #     projectid - project who will own the VLAN
      #     vlan - the ID or VID of the VLAN. Default is an "untagged" VLAN.
      #     zoneid - the Zone ID of the VLAN IP range
      #     page - Pagination

      args.merge!('command' => 'listVlanIpRanges')

      return request(args)
  end
 

  def createSSHKeyPair(args={})
      # Create a new keypair and returns the private key
      # 
      # args - A dictionary. The following are options for keys:
      #     name - Name of the keypair
      #     account - an optional account for the ssh key. Must be used with domainId.
      #     domainid - an optional domainId for the ssh key. If the account parameter is
      #        used, domainId must also be used.
      #     projectid - an optional project for the ssh key

      args.merge!('command' => 'createSSHKeyPair')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def deleteSSHKeyPair(args={})
      # Deletes a keypair by name
      # 
      # args - A dictionary. The following are options for keys:
      #     name - Name of the keypair
      #     account - the account associated with the keypair. Must be used with the dom
      #       ainId parameter.
      #     domainid - the domain ID associated with the keypair
      #     projectid - the project associated with keypair

      args.merge!('command' => 'deleteSSHKeyPair')
      if not args.has_key?('name')
          raise ArgumentError, "Missing required argument 'name'"
      end

      return request(args)
  end
 

  def listSSHKeyPairs(args={})
      # List registered keypairs
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     fingerprint - A public key fingerprint to look for
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     name - A key pair name to look for
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     page - Pagination

      args.merge!('command' => 'listSSHKeyPairs')

      return request(args)
  end
 

  def createTags(args={})
      # Creates resource tag(s)
      # 
      # args - A dictionary. The following are options for keys:
      #     resourceids - list of resources to create the tags for
      #     resourcetype - type of the resource
      #     tags - Map of tags (key/value pairs)
      #     customer - identifies client specific tag. When the value is not null, the t
      #       ag can't be used by cloudStack code internally

      args.merge!('command' => 'createTags')
      if not args.has_key?('resourceids')
          raise ArgumentError, "Missing required argument 'resourceids'"
      end
      if not args.has_key?('resourcetype')
          raise ArgumentError, "Missing required argument 'resourcetype'"
      end
      if not args.has_key?('tags')
          raise ArgumentError, "Missing required argument 'tags'"
      end

      return request(args)
  end
 

  def deleteTags(args={})
      # Deleting resource tag(s)
      # 
      # args - A dictionary. The following are options for keys:
      #     resourceids - Delete tags for resource id(s)
      #     resourcetype - Delete tag by resource type
      #     tags - Delete tags matching key/value pairs

      args.merge!('command' => 'deleteTags')
      if not args.has_key?('resourceids')
          raise ArgumentError, "Missing required argument 'resourceids'"
      end
      if not args.has_key?('resourcetype')
          raise ArgumentError, "Missing required argument 'resourcetype'"
      end

      return request(args)
  end
 

  def listTags(args={})
      # List resource tag(s)
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     customer - list by customer name
      #     domainid - list only resources belonging to the domain specified
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     key - list by key
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     resourceid - list by resource id
      #     resourcetype - list by resource type
      #     value - list by value
      #     page - Pagination

      args.merge!('command' => 'listTags')

      return request(args)
  end
 

  def addNiciraNvpDevice(args={})
      # Adds a Nicira NVP device
      # 
      # args - A dictionary. The following are options for keys:
      #     hostname - Hostname of ip address of the Nicira NVP Controller.
      #     password - Credentials to access the Nicira Controller API
      #     physicalnetworkid - the Physical Network ID
      #     transportzoneuuid - The Transportzone UUID configured on the Nicira Controll
      #       er
      #     username - Credentials to access the Nicira Controller API

      args.merge!('command' => 'addNiciraNvpDevice')
      if not args.has_key?('hostname')
          raise ArgumentError, "Missing required argument 'hostname'"
      end
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end
      if not args.has_key?('physicalnetworkid')
          raise ArgumentError, "Missing required argument 'physicalnetworkid'"
      end
      if not args.has_key?('transportzoneuuid')
          raise ArgumentError, "Missing required argument 'transportzoneuuid'"
      end
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end

      return request(args)
  end
 

  def deleteNiciraNvpDevice(args={})
      # delete a nicira nvp device
      # 
      # args - A dictionary. The following are options for keys:
      #     nvpdeviceid - Nicira device ID

      args.merge!('command' => 'deleteNiciraNvpDevice')
      if not args.has_key?('nvpdeviceid')
          raise ArgumentError, "Missing required argument 'nvpdeviceid'"
      end

      return request(args)
  end
 

  def listNiciraNvpDevices(args={})
      # Lists Nicira NVP devices
      # 
      # args - A dictionary. The following are options for keys:
      #     keyword - List by keyword
      #     nvpdeviceid - nicira nvp device ID
      #     page - 
      #     pagesize - 
      #     physicalnetworkid - the Physical Network ID
      #     page - Pagination

      args.merge!('command' => 'listNiciraNvpDevices')

      return request(args)
  end
 

  def updateResourceLimit(args={})
      # Updates resource limits for an account or domain.
      # 
      # args - A dictionary. The following are options for keys:
      #     resourcetype - Type of resource to update. Values are 0, 1, 2, 3, and 4. 0 -
      #        Instance. Number of instances a user can create. 1 - IP. Number of public IP ad
      #       dresses a user can own. 2 - Volume. Number of disk volumes a user can create.3 -
      #        Snapshot. Number of snapshots a user can create.4 - Template. Number of templat
      #       es that a user can register/create.
      #     account - Update resource for a specified account. Must be used with the dom
      #       ainId parameter.
      #     domainid - Update resource limits for all accounts in specified domain. If u
      #       sed with the account parameter, updates resource limits for a specified account 
      #       in specified domain.
      #     max - Maximum resource limit.
      #     projectid - Update resource limits for project

      args.merge!('command' => 'updateResourceLimit')
      if not args.has_key?('resourcetype')
          raise ArgumentError, "Missing required argument 'resourcetype'"
      end

      return request(args)
  end
 

  def updateResourceCount(args={})
      # Recalculate and update resource count for an account or domain.
      # 
      # args - A dictionary. The following are options for keys:
      #     domainid - If account parameter specified then updates resource counts for a
      #        specified account in this domain else update resource counts for all accounts &
      #        child domains in specified domain.
      #     account - Update resource count for a specified account. Must be used with t
      #       he domainId parameter.
      #     projectid - Update resource limits for project
      #     resourcetype - Type of resource to update. If specifies valid values are 0, 
      #       1, 2, 3, and 4. If not specified will update all resource counts0 - Instance. Nu
      #       mber of instances a user can create. 1 - IP. Number of public IP addresses a use
      #       r can own. 2 - Volume. Number of disk volumes a user can create.3 - Snapshot. Nu
      #       mber of snapshots a user can create.4 - Template. Number of templates that a use
      #       r can register/create.

      args.merge!('command' => 'updateResourceCount')
      if not args.has_key?('domainid')
          raise ArgumentError, "Missing required argument 'domainid'"
      end

      return request(args)
  end
 

  def listResourceLimits(args={})
      # Lists resource limits.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     id - Lists resource limits by ID.
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     resourcetype - Type of resource to update. Values are 0, 1, 2, 3, and 4. 0 -
      #        Instance. Number of instances a user can create. 1 - IP. Number of public IP ad
      #       dresses a user can own. 2 - Volume. Number of disk volumes a user can create.3 -
      #        Snapshot. Number of snapshots a user can create.4 - Template. Number of templat
      #       es that a user can register/create.
      #     page - Pagination

      args.merge!('command' => 'listResourceLimits')

      return request(args)
  end
 

  def associateIpAddress(args={})
      # Acquires and associates a public IP to an account.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - the account to associate with this IP address
      #     domainid - the ID of the domain to associate with this IP address
      #     networkid - The network this ip address should be associated to.
      #     projectid - Deploy vm for the project
      #     vpcid - the VPC you want the ip address to be associated with
      #     zoneid - the ID of the availability zone you want to acquire an public IP ad
      #       dress from

      args.merge!('command' => 'associateIpAddress')

      return request(args)
  end
 

  def disassociateIpAddress(args={})
      # Disassociates an ip address from the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the public ip address to disassociate

      args.merge!('command' => 'disassociateIpAddress')
      if not args.has_key?('id')
          raise ArgumentError, "Missing required argument 'id'"
      end

      return request(args)
  end
 

  def listPublicIpAddresses(args={})
      # Lists all public ip addresses
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     allocatedonly - limits search results to allocated public IP addresses
      #     associatednetworkid - lists all public IP addresses associated to the networ
      #       k specified
      #     domainid - list only resources belonging to the domain specified
      #     forloadbalancing - list only ips used for load balancing
      #     forvirtualnetwork - the virtual network for the IP address
      #     id - lists ip address by id
      #     ipaddress - lists the specified IP address
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     issourcenat - list only source nat ip addresses
      #     isstaticnat - list only static nat ip addresses
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     physicalnetworkid - lists all public IP addresses by physical network id
      #     projectid - list objects by project
      #     tags - List resources by tags (key/value pairs)
      #     vlanid - lists all public IP addresses by VLAN ID
      #     vpcid - List ips belonging to the VPC
      #     zoneid - lists all public IP addresses by Zone ID
      #     page - Pagination

      args.merge!('command' => 'listPublicIpAddresses')

      return request(args)
  end
 

  def addSwift(args={})
      # Adds Swift.
      # 
      # args - A dictionary. The following are options for keys:
      #     url - the URL for swift
      #     account - the account for swift
      #     key - key for the user for swift
      #     username - the username for swift

      args.merge!('command' => 'addSwift')
      if not args.has_key?('url')
          raise ArgumentError, "Missing required argument 'url'"
      end

      return request(args)
  end
 

  def listSwifts(args={})
      # List Swift.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the id of the swift
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listSwifts')

      return request(args)
  end
 

  def ldapConfig(args={})
      # Configure the LDAP context for this site.
      # 
      # args - A dictionary. The following are options for keys:
      #     hostname - Hostname or ip address of the ldap server eg: my.ldap.com
      #     queryfilter - You specify a query filter here, which narrows down the users,
      #        who can be part of this domain.
      #     searchbase - The search base defines the starting point for the search in th
      #       e directory tree Example:  dc=cloud,dc=com.
      #     binddn - Specify the distinguished name of a user with the search permission
      #        on the directory.
      #     bindpass - Enter the password.
      #     port - Specify the LDAP port if required, default is 389.
      #     ssl - Check Use SSL if the external LDAP server is configured for LDAP over 
      #       SSL.
      #     truststore - Enter the path to trust certificates store.
      #     truststorepass - Enter the password for trust store.

      args.merge!('command' => 'ldapConfig')
      if not args.has_key?('hostname')
          raise ArgumentError, "Missing required argument 'hostname'"
      end
      if not args.has_key?('queryfilter')
          raise ArgumentError, "Missing required argument 'queryfilter'"
      end
      if not args.has_key?('searchbase')
          raise ArgumentError, "Missing required argument 'searchbase'"
      end

      return request(args)
  end
 

  def ldapRemove(args={})
      # Remove the LDAP context for this site.
      # 
      # args - A dictionary. The following are options for keys:

      args.merge!('command' => 'ldapRemove')

      return request(args)
  end
 

  def listOsTypes(args={})
      # Lists all supported OS types for this cloud.
      # 
      # args - A dictionary. The following are options for keys:
      #     description - list os by description
      #     id - list by Os type Id
      #     keyword - List by keyword
      #     oscategoryid - list by Os Category id
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listOsTypes')

      return request(args)
  end
 

  def listOsCategories(args={})
      # Lists all supported OS categories for this cloud.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - list Os category by id
      #     keyword - List by keyword
      #     name - list os category by name
      #     page - 
      #     pagesize - 
      #     page - Pagination

      args.merge!('command' => 'listOsCategories')

      return request(args)
  end
 

  def listEvents(args={})
      # A command to list events.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     duration - the duration of the event
      #     enddate - the end date range of the list you want to retrieve (use format "y
      #       yyy-MM-dd" or the new format "yyyy-MM-dd HH:mm:ss")
      #     entrytime - the time the event was entered
      #     id - the ID of the event
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     level - the event level (INFO, WARN, ERROR)
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     projectid - list objects by project
      #     startdate - the start date range of the list you want to retrieve (use forma
      #       t "yyyy-MM-dd" or the new format "yyyy-MM-dd HH:mm:ss")
      #     type - the event type (see event types)
      #     page - Pagination

      args.merge!('command' => 'listEvents')

      return request(args)
  end
 

  def listEventTypes(args={})
      # List Event Types
      # 
      # args - A dictionary. The following are options for keys:
      #     page - Pagination

      args.merge!('command' => 'listEventTypes')

      return request(args)
  end
 

  def queryAsyncJobResult(args={})
      # Retrieves the current status of asynchronous job.
      # 
      # args - A dictionary. The following are options for keys:
      #     jobid - the ID of the asychronous job

      args.merge!('command' => 'queryAsyncJobResult')
      if not args.has_key?('jobid')
          raise ArgumentError, "Missing required argument 'jobid'"
      end

      return request(args)
  end
 

  def listAsyncJobs(args={})
      # Lists all pending asynchronous jobs for the account.
      # 
      # args - A dictionary. The following are options for keys:
      #     account - List resources by account. Must be used with the domainId paramete
      #       r.
      #     domainid - list only resources belonging to the domain specified
      #     isrecursive - defaults to false, but if true, lists all resources from the p
      #       arent specified by the domainId till leaves.
      #     keyword - List by keyword
      #     listall - If set to false, list only resources belonging to the command's ca
      #       ller; if set to true - list resources that the caller is authorized to see. Defa
      #       ult value is false
      #     page - 
      #     pagesize - 
      #     startdate - the start date of the async job
      #     page - Pagination

      args.merge!('command' => 'listAsyncJobs')

      return request(args)
  end
 

  def listCapacity(args={})
      # Lists all the system wide capacities.
      # 
      # args - A dictionary. The following are options for keys:
      #     clusterid - lists capacity by the Cluster ID
      #     fetchlatest - recalculate capacities and fetch the latest
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     podid - lists capacity by the Pod ID
      #     sortby - Sort the results. Available values: Usage
      #     type - lists capacity by type* CAPACITY_TYPE_MEMORY = 0* CAPACITY_TYPE_CPU =
      #        1* CAPACITY_TYPE_STORAGE = 2* CAPACITY_TYPE_STORAGE_ALLOCATED = 3* CAPACITY_TYP
      #       E_VIRTUAL_NETWORK_PUBLIC_IP = 4* CAPACITY_TYPE_PRIVATE_IP = 5* CAPACITY_TYPE_SEC
      #       ONDARY_STORAGE = 6* CAPACITY_TYPE_VLAN = 7* CAPACITY_TYPE_DIRECT_ATTACHED_PUBLIC
      #       _IP = 8* CAPACITY_TYPE_LOCAL_STORAGE = 9.
      #     zoneid - lists capacity by the Zone ID
      #     page - Pagination

      args.merge!('command' => 'listCapacity')

      return request(args)
  end
 

  def logout(args={})
      # Logs out the user
      # 
      # args - A dictionary. The following are options for keys:

      args.merge!('command' => 'logout')

      return request(args)
  end
 

  def login(args={})
      # Logs a user into the CloudStack. A successful login attempt will generate a JSES
      # SIONID cookie value that can be passed in subsequent Query command calls until t
      # he "logout" command has been issued or the session has expired.
      # 
      # args - A dictionary. The following are options for keys:
      #     username - Username
      #     password - Hashed password (Default is MD5). If you wish to use any other ha
      #       shing algorithm, you would need to write a custom authentication adapter See Doc
      #       s section.
      #     domain - path of the domain that the user belongs to. Example: domain=/com/c
      #       loud/internal.  If no domain is passed in, the ROOT domain is assumed.
      #     domainId - id of the domain that the user belongs to. If both domain and dom
      #       ainId are passed in, "domainId" parameter takes precendence

      args.merge!('command' => 'login')
      if not args.has_key?('username')
          raise ArgumentError, "Missing required argument 'username'"
      end
      if not args.has_key?('password')
          raise ArgumentError, "Missing required argument 'password'"
      end

      return request(args)
  end
 

  def listHypervisors(args={})
      # List hypervisors
      # 
      # args - A dictionary. The following are options for keys:
      #     zoneid - the zone id for listing hypervisors.
      #     page - Pagination

      args.merge!('command' => 'listHypervisors')

      return request(args)
  end
 

  def getCloudIdentifier(args={})
      # Retrieves a cloud identifier.
      # 
      # args - A dictionary. The following are options for keys:
      #     userid - the user ID for the cloud identifier

      args.merge!('command' => 'getCloudIdentifier')
      if not args.has_key?('userid')
          raise ArgumentError, "Missing required argument 'userid'"
      end

      return request(args)
  end
 

  def uploadCustomCertificate(args={})
      # Uploads custom certificate
      # 
      # args - A dictionary. The following are options for keys:
      #     certificate - the custom cert to be uploaded
      #     domainsuffix - DNS domain suffix that the certificate is granted for
      #     id - the custom cert id in the chain
      #     name - the alias of the certificate
      #     privatekey - the private key for the certificate

      args.merge!('command' => 'uploadCustomCertificate')
      if not args.has_key?('certificate')
          raise ArgumentError, "Missing required argument 'certificate'"
      end
      if not args.has_key?('domainsuffix')
          raise ArgumentError, "Missing required argument 'domainsuffix'"
      end

      return request(args)
  end
 

  def listAlerts(args={})
      # Lists all alerts.
      # 
      # args - A dictionary. The following are options for keys:
      #     id - the ID of the alert
      #     keyword - List by keyword
      #     page - 
      #     pagesize - 
      #     type - list by alert type
      #     page - Pagination

      args.merge!('command' => 'listAlerts')

      return request(args)
  end
end
