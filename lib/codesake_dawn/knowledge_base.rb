require "codesake_dawn/kb/basic_check"
require "codesake_dawn/kb/cve_2013_1855"

module Codesake
  module Dawn
    class KnowledgeBase
      attr_reader :security_checks

      def initialize
        @security_checks = [Codesake::Dawn::Kb::Cve_2013_1855.new]
      end


    end

  end
end
