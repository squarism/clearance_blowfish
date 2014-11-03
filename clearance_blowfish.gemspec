# -*- encoding: utf-8 -*-

require File.expand_path('../lib/clearance_blowfish/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "clearance_blowfish"
  gem.version       = ClearanceBlowfish::VERSION
  gem.summary       = %q{Blowfish encryption for Clearance auth}
  gem.description   = %q{Clearance may be removing Blowfish, this is extracted.}
  gem.license       = "MIT"
  gem.authors       = ["Chris Dillon"]
  gem.email         = "squarism@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/clearance_blowfish"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.5'
  gem.add_development_dependency 'rake', '~> 10.3'
  gem.add_development_dependency 'rdoc', '~> 4.1'
  gem.add_development_dependency 'rspec', '~> 3.1'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
