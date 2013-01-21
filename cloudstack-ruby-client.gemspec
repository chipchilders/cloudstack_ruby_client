# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudstack-ruby-client/version'

Gem::Specification.new do |gem|
  gem.name          = "cloudstack-ruby-client"
  gem.version       = Cloudstack::Ruby::Client::VERSION
  gem.authors       = ["Chip Childers"]
  gem.email         = ["chip.childers@gmail.com"]
  gem.description   = %q{A Ruby client for CloudStack's API, licensed via the Apache Software License v2.}
  gem.summary       = %q{A Ruby client for CloudStack's API, licensed via the Apache Software License v2.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
