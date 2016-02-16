# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chivy/version'

Gem::Specification.new do |spec|
  spec.name          = "chivy"
  spec.version       = Chivy::VERSION
  spec.authors       = ["Daniel Senff"]
  spec.email         = ["mail@danielsenff.de"]
  spec.summary       = %q{List and fill missing translation keys in YAML-files.}
  spec.description   = %q{Offers a quick way of analyzing language YAML-files and to add missing translation keys from the CLI.}
  spec.homepage      = "http://github.com/Dahie/chivy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "commander"
  spec.add_dependency "hashdiff"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "pry-byebug"
end
