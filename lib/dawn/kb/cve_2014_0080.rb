  module Dawn
    module Kb
      # Automatically created with rake on 2014-02-19
      class CVE_2014_0080
        # Include the testing skeleton for this CVE
        include DependencyCheck

        def initialize
          message = "SQL injection vulnerability in activerecord/lib/active_record/connection_adapters/postgresql/cast.rb in Active Record in Ruby on Rails 4.0.x before 4.0.3, and 4.1.0.beta1, when PostgreSQL is used, allows remote attackers to execute \"add data\" SQL commands via vectors involving \ (backslash) characters that are not properly handled in operations on array columns."

           super({
            :name=>"CVE-2014-0080",
            :cvss=>"AV:N/AC:M/Au:N/C:P/I:P/A:P",
            :release_date => Date.new(2014, 2, 20),
            :cwe=>"89",
            :owasp=>"A1",
            :applies=>["rails"],
            :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
            :message=>message,
            :mitigation=>"Please upgrade rails version at least to 4.0.3 or 4.1.0.beta2. As a general rule, using the latest stable rails version is recommended.",
            :aux_links=>["https://groups.google.com/forum/message/raw?msg=rubyonrails-security/Wu96YkTUR6s/pPLBMZrlwvYJ"]
           })
           self.safe_dependencies = [{:name=>"rails", :version=>['4.0.3', '4.1.0.beta2']}]
          self.save_major = true

        end
      end
    end
  end
