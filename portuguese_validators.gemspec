# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'portuguese_validators/version'

Gem::Specification.new do |spec|
  spec.name          = 'portuguese_validators'
  spec.version       = PortugueseValidators::VERSION
  spec.authors       = ['Ricardo Otero']
  spec.email         = ['oterosantos@gmail.com']
  spec.summary       = 'Validators for portuguese NIB, NIF, BI and phone.'
  spec.description   = spec.summary
  spec.homepage      = 'http://github.com/rikas/portuguese_validators/fork'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '~> 0.49', '> 0.35'

  spec.add_dependency 'activemodel'
end
