# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codesake_dawn/version'

Gem::Specification.new do |gem|
  gem.name          = "codesake_dawn"
  gem.version       = Codesake::Dawn::VERSION
  gem.authors       = ["Paolo Perego"]
  gem.email         = ["thesp0nge@gmail.com"]
  gem.description   = %q{codesake dawn is the static analysis engine for ruby powered web applications used in codesake.com application security portal.}
  gem.summary       = %q{codesake dawn is the static analysis engine for ruby powered web applications}
  gem.homepage      = "http://codesake.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'codesake_commons'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
