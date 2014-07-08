# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codesake/dawn/version'

Gem::Specification.new do |gem|
  gem.name          = "codesake-dawn"
  gem.version       = Codesake::Dawn::VERSION
  gem.authors       = ["Paolo Perego"]
  gem.email         = ["paolo@codesake.com"]
  gem.description   = %q{Codesake::Dawn is a security source code scanner for ruby powered code. It is especially designed for web applications, but it works also with general purpose ruby scripts. Codesake::Dawn supports all major MVC frameworks like ruby on rails, padrino and sinatra; it provides more than 150 security checks with their own mitigation suggestion.}
  gem.summary       = %q{Codesake::Dawn is a security source code scanner for ruby powered code. It is crafted with love to make your sinatra, padrino and ruby on rails web applications secure.}
  gem.homepage      = "http://dawn.codesake.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.cert_chain  = ['certs/paolo_at_codesake_dot_com.pem']
  gem.signing_key = File.expand_path("~/.ssh/paolo_at_codesake_dot_com-private_key.pem") if $0 =~ /gem\z/
  gem.post_install_message = "Thank you for installing \"dawn\", a security source code scanner for Ruby. Start securing your code by running \"dawn project_folder\" right now or just run \"dawn --help\" if you want to explore all possible command line flags.\n\n**PLEASE READ THIS** On November 1st, 2014 codesake-dawn gem will change the name in 'dawn'. On this date the first 'dawn' gem will be published and 'codesake-dawn' will be just a placeholder requiring the new gem."

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
