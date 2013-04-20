# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = "mandrill_api"
  spec.version       = MandrillApi::VERSION
  spec.authors       = ["bilalbash"]
  spec.email         = ["bilal.basharat@gmail.com"]
  spec.description   = %q{this gem can be used as a mandrill api wrapper}
  spec.summary       = %q{this gem simplify mandrill api to be used in rails application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "active_resource"
end
