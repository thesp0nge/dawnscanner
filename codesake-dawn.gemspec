# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codesake/dawn/version'

Gem::Specification.new do |gem|
  gem.name          = "codesake-dawn"
  gem.version       = Codesake::Dawn::VERSION
  gem.authors       = ["Paolo Perego"]
  gem.email         = ["thesp0nge@gmail.com"]
  gem.description   = %q{dawn is a security static source code analyzer for web applications written in ruby. It supports major MVC frameworks like sinatra, padrino and ruby on rails. dawn output is a list of security vulnerabilities affecting your code. It provides more than 140 security checks with their own mitigation suggestion.}
  gem.summary       = %q{dawn is a security static source code analyzer for sinatra, padrino and ruby on rails web applications.}
  gem.homepage      = "http://dawn.codesake.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "codesake-commons", "~> 0.90.0"
  gem.add_dependency 'cvss'
  gem.add_dependency 'haml'
  gem.add_dependency 'parser'
  gem.add_dependency 'ptools'
  gem.add_dependency 'ruby_parser'
  gem.add_dependency 'sys-uname'
  gem.add_dependency 'grit'

  gem.add_dependency ('coveralls')

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency('tomdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('simplecov')
end
