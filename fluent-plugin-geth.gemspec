# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-geth"
  spec.version       = "0.0.1"
  spec.authors       = ["cicorias"]
  spec.email         = ["github@cicoria.com"]
  spec.description   = %q{Geth input plugin for Fluent event collector}
  spec.summary       = %q{Geth client input plugin for Fluent event collector}
  spec.homepage      = "https://github.com/cicorias/fluent-plugin-geth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_runtime_dependency "fluentd", "~> 0"
end




# take a look here: https://github.com/tiwakawa/fluent-plugin-df/blob/master/fluent-plugin-df.gemspec