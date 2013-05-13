# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codesake/dawn/version'

Gem::Specification.new do |gem|
  gem.name          = "codesake-dawn"
  gem.version       = Codesake::Dawn::VERSION
  gem.authors       = ["Paolo Perego"]
  gem.email         = ["thesp0nge@gmail.com"]
  gem.description   = %q{dawn is a security static source code analyzer for web applications written in ruby. It supports major MVC frameworks like sinatra, padrino and ruby on rails. dawn output is a list of security vulnerabilities affecting your code with a suggestion on how to mitigate all of them.}
  gem.summary       = %q{dawn is a security static source code analyzer for sinatra, padrino and ruby on rails web applicartions.}
  gem.homepage      = "http://codesake.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'codesake_commons', '> 0.50.0'
  gem.add_dependency 'cvss'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency('tomdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('simplecov')
end
