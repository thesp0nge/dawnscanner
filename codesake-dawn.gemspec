# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codesake/dawn/version'

Gem::Specification.new do |gem|
  gem.name          = "codesake-dawn"
  gem.version       = Codesake::Dawn::VERSION
  gem.authors       = ["Paolo Perego"]
  gem.email         = ["paolo@codesake.com"]
  gem.description   = %q{Codesake::Dawn is a security source code scanner for ruby powered code. Starting from January 07, 2015 this gem is renamed to dawnscanner and this version is no longer supported. Please, upgrade your Gemfile.}
  gem.summary   = %q{Codesake::Dawn is a security source code scanner for ruby powered code. Starting from January 07, 2015 this gem is renamed to dawnscanner and this version is no longer supported. Please, upgrade your Gemfile.}
  gem.homepage      = "http://dawn.codesake.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.cert_chain  = ['certs/paolo_at_codesake_dot_com.pem']
  gem.signing_key = File.expand_path("~/.ssh/paolo_at_codesake_dot_com-private_key.pem") if $0 =~ /gem\z/
  gem.post_install_message = <<-MESSAGE
!    The 'codesake-dawn' gem has been deprecated and has been replaced by 'dawnscanner'.
!    See: https://rubygems.org/gems/dawnscanner
!    And: https://github.com/thesp0nge/dawnscanner
MESSAGE
  gem.required_ruby_version = '>= 1.9.2'

  gem.add_dependency "codesake-commons", "~> 1.0.0"
  gem.add_dependency 'cvss'
  gem.add_dependency 'haml'
  gem.add_dependency 'parser'
  gem.add_dependency 'ptools'
  gem.add_dependency 'ruby_parser'
  gem.add_dependency 'sys-uname'
  gem.add_dependency 'grit'
  gem.add_dependency 'terminal-table'
  gem.add_dependency 'justify'

  gem.add_dependency ('coveralls')

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency('tomdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('simplecov')
end
