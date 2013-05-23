# Codesake Dawn Todo 

## #1 Introduce check dependency
CVE-2013-1655 introduces a security issue that depends on a particular gem only
when running a particular Ruby interpreter version. For such a reason in
BasicCheck class I introduced a ruby\_version attribute as a String and a
is\_vulnerable\_ruby\_version? method to match this thing.

CVE-2013-1821 introduces a security issue about the specific Ruby interpreter
version, therefore I introduced a new kind of security check, the
RubyVersionCheck. Since RubyVersionCheck includes also BasicCheck, it has 2
attributes (filled in engine.rb apply and apply\_all methods that are almost
the same. The ruby\_version and the detected\_ruby that it is an hash.

This situation introduces a logical mess and the chances of having bugs in the
future are very high. So it must be possible to declare a complex security
check as a mixin of basic security checks, this way:


``` ruby
module Codesake
	module Dawn
		module Kb
      class MyVeryComplexSecurityCheck
        include ConditionalSecurityCheck # TODO: name check

        def initialize
          # since DependencyCheck and friends are module, I need to introduce
          # also a scaffolding class including that module so I can create an instance of
          # that.
          a_dependency_check = Codesake::Dawn::Kb::BasicDependencyCheck.new
          a_dependency_check.safe_dependencies = [{:name=>"puppet", :version=>['2.7.21', '3.1.1']}]

          a_ruby_version_check = Codesake::Dawn::Kb::BasicRubyVersionCheck.new
          a_ruby_version_check.safe_rubies = [{:version=>"1.9.3", :patchlevel=>"p392"}, {:version=>"2.0.0", :patchlevel=>"p195"}]

          super({
              :name=>"My very complex security check",
              :cvss=>"AV:N/AC:L/Au:N/C:P/I:P/A:P",
              :release_date => Date.new(2013, 5, 23),
              :cwe=>"20",
              :owasp=>"A9", 
              :applies=>["rails", "sinatra", "padrino"],
              :kind=>Codesake::Dawn::KnowledgeBase::CONDITIONAL_CHECK,
              # => there is no reason not to support multiple boolean operators
              # when checking security checks in the chain for their vuln? return value
              :condition=>:or, 
              :message=>message,
              :mitigation=>"Please upgrade puppet gem to a newer version",
              :aux_links=>["https://puppetlabs.com/security/cve/cve-2013-1655/"],
              :security_checks = [a_dependency_check, a_ruby_version_check]
          })
        end
      end
		end
	end
end
``` 
