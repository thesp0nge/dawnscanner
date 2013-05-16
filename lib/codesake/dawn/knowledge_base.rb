# Core KB 
require "codesake/dawn/kb/basic_check"
require "codesake/dawn/kb/pattern_match_check"
require "codesake/dawn/kb/dependency_check"

# Q&A related checks
require "codesake/dawn/kb/not_revised_code"

# CVE - 2011
require "codesake/dawn/kb/cve_2011_2931"

# CVE - 2012
require "codesake/dawn/kb/cve_2012_2660"
require "codesake/dawn/kb/cve_2012_2661"
require "codesake/dawn/kb/cve_2012_2694"
require "codesake/dawn/kb/cve_2012_2695"
require "codesake/dawn/kb/cve_2012_3465"
require "codesake/dawn/kb/cve_2012_6496"
require "codesake/dawn/kb/cve_2012_6497"

# CVE - 2013
require "codesake/dawn/kb/cve_2013_0155"
require "codesake/dawn/kb/cve_2013_0269"
require "codesake/dawn/kb/cve_2013_0333"
require "codesake/dawn/kb/cve_2013_1800"
require "codesake/dawn/kb/cve_2013_1854"
require "codesake/dawn/kb/cve_2013_1855"
require "codesake/dawn/kb/cve_2013_1856"
require "codesake/dawn/kb/cve_2013_1857"

module Codesake
  module Dawn
    # XXX: Check if it best using a singleton here
    class KnowledgeBase

      DEPENDENCY_CHECK    = :dependency_check
      PATTERN_MATCH_CHECK = :pattern_match_check

      def initialize
        @security_checks = Codesake::Dawn::KnowledgeBase.load_security_checks
      end

      def self.find(checks=nil, name)
        return nil if name.nil? or name.empty?
        checks = Codesake::Dawn::KnowledgeBase.load_security_checks if checks.nil?

        checks.each do |sc|
          return sc if sc.name == name
        end
        nil
      end

      def find(name)
        Codesake::Dawn::KnowledgeBase.find(@security_checks, name)
      end

      def all
        @security_checks
      end

      def all_by_mvc(mvc)
        ret = []
        @security_checks.each do |sc|
          ret << sc if sc.applies_to?(mvc)
        end

      end

      def all_sinatra_checks
        self.all_by_mvc(:sinatra)
      end

      def all_rails_checks
        self.all_by_mvc(:rails)
      end

      def all_padrino_checks
        self.all_by_mvc(:padrino)
      end

      def all_rack_checks
        self.all_by_mvc(:rack)
      end

      def self.load_security_checks
        [  
          Codesake::Dawn::Kb::NotRevisedCode.new,
          Codesake::Dawn::Kb::CVE_2011_2931.new, 
          Codesake::Dawn::Kb::CVE_2012_2660.new, 
          Codesake::Dawn::Kb::CVE_2012_2661.new, 
          Codesake::Dawn::Kb::CVE_2012_2694.new, 
          Codesake::Dawn::Kb::CVE_2012_2695.new, 
          Codesake::Dawn::Kb::CVE_2012_3465.new, 
          Codesake::Dawn::Kb::CVE_2012_6496.new, 
          Codesake::Dawn::Kb::CVE_2012_6497.new,
          Codesake::Dawn::Kb::CVE_2013_0155.new,
          Codesake::Dawn::Kb::CVE_2013_0269.new,
          Codesake::Dawn::Kb::CVE_2013_0333.new,
          Codesake::Dawn::Kb::CVE_2013_1800.new,
          Codesake::Dawn::Kb::CVE_2013_1854.new, 
          Codesake::Dawn::Kb::CVE_2013_1855.new, 
          Codesake::Dawn::Kb::CVE_2013_1856.new, 
          Codesake::Dawn::Kb::CVE_2013_1857.new, 
        ]
      end
    end

  end
end
