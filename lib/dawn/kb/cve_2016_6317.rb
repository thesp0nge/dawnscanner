module Dawn
  module Kb
    # Automatically created with rake on 2016-10-02
    class CVE_2016_6317
      include DependencyCheck

      def initialize
        title   = "Unsafe Query Generation Risk in Active Record"
        message = "Due to the way Active Record interprets parameters in combination with the way that JSON parameters are parsed, it is possible for an attacker to issue unexpected database queries with “IS NULL” or empty where clauses. This issue does not let an attacker insert arbitrary values into an SQL query, however they can cause the query to check for NULL or eliminate a WHERE clause when most users wouldn’t expect it."

        super({
          :title=>title,
          :name=> "CVE-2016-6317",
          :cve=>"2016-6317",
          :osvdb=>"",
          :cvss=>"AV:N/AC:L/Au:N/C:N/I:P/A:N",
          :release_date => Date.new(2016, 8, 11),
          :cwe=>"",
          :owasp=>"A9",
          :applies=>["rails", "sinatra", "padrino"],
          :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
          :message=>message,
          :mitigation=>"Please upgrade activerecord gem to version 4.2.7.1. Please note that versions 5.0.0 or later are not affected.",
          :aux_links=>['https://groups.google.com/forum/#!topic/rubyonrails-security/rgO20zYW33s']
        })
        self.safe_dependencies = [{:name=>"activerecord", :version=>['4.2.7.1']}]
        self.not_affected = {:name=>"activerecord", :version=>['1.x.x', '2.x.x', '3.x.x', '4.0.x', '4.1.x', '5.0.x']}

      end
    end
  end
end
