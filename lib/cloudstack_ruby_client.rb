%w[ base64 cgi openssl uri digest/sha1 net/https net/http json  ].each { |f| require f  }

require 'cloudstack_ruby_client/version'
require 'cloudstack_ruby_client/client_helper'

Dir[File.join(File.dirname(__FILE__), 'cloudstack_ruby_client/api/*.rb')].sort.each { |lib| require lib  }

require 'cloudstack_ruby_client/base_client'
require 'cloudstack_ruby_client/client'
