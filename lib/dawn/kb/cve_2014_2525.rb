	module Dawn
		module Kb
      class CVE_2014_2525_a
        include BasicCheck

        def initialize
          message = "When relying on system wide libyaml, this must be > 0.1.5"
          super({
            :name=>"CVE-2014-2525-a",
            :kind=>Dawn::KnowledgeBase::CUSTOM_CHECK,
          })
        end
        def vuln?
          require 'yaml'
          lyv = Psych.libyaml_version.join(".")
          c = Dawn::Kb::VersionCheck.new
          return c.is_vulnerable_version?('0.1.6', lyv)
        end
      end
      class CVE_2014_2525_b
        include DependencyCheck

        def initialize
          message = "When non relying on system wide libyaml, psych gem must be > 2.0.5"
          super({
            :name=>"CVE-2014-2525-b",
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          })
          self.safe_dependencies = [{:name=>"psych", :version=>['2.0.5']}]
        end

      end

			# Automatically created with rake on 2014-03-31
			class CVE_2014_2525
				include ComboCheck

				def initialize
          message = ""

          super({
            :name=>"CVE-2014-2525",
            :cvss=>"",
            :release_date => Date.new(2014, 3, 28),
            :cwe=>"",
            :owasp=>"A9",
            :applies=>["rails", "sinatra", "padrino"],
            :kind=>Dawn::KnowledgeBase::COMBO_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade your system libyaml or upgrade psych gem to version 2.0.5 or higher that is linked with a safe libyaml version.",
            :aux_links=>["https://www.ruby-lang.org/en/news/2014/03/29/heap-overflow-in-yaml-uri-escape-parsing-cve-2014-2525"],
            :severity=>:high,
            :prority=>:high,
            :checks=>[CVE_2014_2525_a.new, CVE_2014_2525_b.new]
          })
				end
			end
		end
	end
