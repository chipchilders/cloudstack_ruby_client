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
  include Accounts::Usage

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
  include Network::VPC

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

  ## Auto scale command injection
  include AutoScale::AutoScale

  ## Firewall command injection
  include Firewall::Firewall

end
