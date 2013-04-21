require "codesake/dawn/kb/basic_check"
require "codesake/dawn/kb/pattern_match_check"
require "codesake/dawn/kb/dependency_check"
require "codesake/dawn/kb/cve_2013_1855"
require "codesake/dawn/kb/cve_2013_1800"

module Codesake
  module Dawn
    class KnowledgeBase
      attr_reader :security_checks

      def initialize
        @security_checks = [
          Codesake::Dawn::Kb::Cve_2013_1855.new, 
          Codesake::Dawn::Kb::CVE_2013_1800.new
        ]
      end


    end

  end
end
