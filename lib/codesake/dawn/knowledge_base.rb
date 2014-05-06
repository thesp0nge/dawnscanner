# Core KB
require "codesake/dawn/kb/basic_check"
require "codesake/dawn/kb/pattern_match_check"
require "codesake/dawn/kb/dependency_check"
require "codesake/dawn/kb/ruby_version_check"
require "codesake/dawn/kb/operating_system_check"
require "codesake/dawn/kb/combo_check"
require "codesake/dawn/kb/version_check"
require "codesake/dawn/kb/deprecation_check"

# Q&A related checks
## Not revised code
require "codesake/dawn/kb/not_revised_code"
# require "codesake/dawn/kb/owasp_ror_cheatsheet"

## Owasp ROR Cheatsheet

require 'codesake/dawn/kb/owasp_ror_cheatsheet/command_injection'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/csrf'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/session_stored_in_database'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/mass_assignment_in_model'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/security_related_headers'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/check_for_safe_redirect_and_forward'
require 'codesake/dawn/kb/owasp_ror_cheatsheet/sensitive_files'

# Security checks with no or pending CVE

# A XSS issue on Simple Form gem reported by Rafael Mendonça França on
# November, 29 2013
#
# https://groups.google.com/forum/#!topic/ruby-security-ann/flHbLMb07tE
require "codesake/dawn/kb/simpleform_xss_20131129"

# CVE - 2004
require "codesake/dawn/kb/cve_2004_0755"
require "codesake/dawn/kb/cve_2004_0983"

# CVE - 2005
require "codesake/dawn/kb/cve_2005_1992"
require "codesake/dawn/kb/cve_2005_2337"

# CVE - 2006
require "codesake/dawn/kb/cve_2006_1931"
require "codesake/dawn/kb/cve_2006_2582"
require "codesake/dawn/kb/cve_2006_3694"
require "codesake/dawn/kb/cve_2006_4112"
require "codesake/dawn/kb/cve_2006_5467"
require "codesake/dawn/kb/cve_2006_6303"
require "codesake/dawn/kb/cve_2006_6852"
require "codesake/dawn/kb/cve_2006_6979"

# CVE - 2007
require "codesake/dawn/kb/cve_2007_0469"
require "codesake/dawn/kb/cve_2007_5162"
require "codesake/dawn/kb/cve_2007_5379"
require "codesake/dawn/kb/cve_2007_5380"
require "codesake/dawn/kb/cve_2007_5770"
require "codesake/dawn/kb/cve_2007_6077"
require "codesake/dawn/kb/cve_2007_6612"

# CVE - 2008

require "codesake/dawn/kb/cve_2008_1145"
require "codesake/dawn/kb/cve_2008_1891"
require "codesake/dawn/kb/cve_2008_2376"
require "codesake/dawn/kb/cve_2008_2662"
require "codesake/dawn/kb/cve_2008_2663"
require "codesake/dawn/kb/cve_2008_2664"
require "codesake/dawn/kb/cve_2008_2725"
require "codesake/dawn/kb/cve_2008_3655"
require "codesake/dawn/kb/cve_2008_3657"
require "codesake/dawn/kb/cve_2008_3790"
require "codesake/dawn/kb/cve_2008_3905"
require "codesake/dawn/kb/cve_2008_4094"
require "codesake/dawn/kb/cve_2008_4310"
require "codesake/dawn/kb/cve_2008_5189"
require "codesake/dawn/kb/cve_2008_7248"

# CVE - 2009
require "codesake/dawn/kb/cve_2009_4078"
require "codesake/dawn/kb/cve_2009_4124"
require "codesake/dawn/kb/cve_2009_4214"

# CVE - 2010
require "codesake/dawn/kb/cve_2010_1330"
require "codesake/dawn/kb/cve_2010_2489"
require "codesake/dawn/kb/cve_2010_3933"

# CVE - 2011
require "codesake/dawn/kb/cve_2011_0188"
require "codesake/dawn/kb/cve_2011_0446"
require "codesake/dawn/kb/cve_2011_0447"
require "codesake/dawn/kb/cve_2011_0739"
require "codesake/dawn/kb/cve_2011_0995"
require "codesake/dawn/kb/cve_2011_1004"
require "codesake/dawn/kb/cve_2011_1005"
require "codesake/dawn/kb/cve_2011_2197"
require "codesake/dawn/kb/cve_2011_2686"
require "codesake/dawn/kb/cve_2011_2705"
require "codesake/dawn/kb/cve_2011_2929"
require "codesake/dawn/kb/cve_2011_2930"
require "codesake/dawn/kb/cve_2011_2931"
require "codesake/dawn/kb/cve_2011_2932"
require "codesake/dawn/kb/cve_2011_3009"
require "codesake/dawn/kb/cve_2011_3186"
require "codesake/dawn/kb/cve_2011_3187"
require "codesake/dawn/kb/cve_2011_4319"
require "codesake/dawn/kb/cve_2011_4815"
require "codesake/dawn/kb/cve_2011_5036"

# CVE - 2012
require "codesake/dawn/kb/cve_2012_1098"
require "codesake/dawn/kb/cve_2012_1099"
require "codesake/dawn/kb/cve_2012_1241"
require "codesake/dawn/kb/cve_2012_2139"
require "codesake/dawn/kb/cve_2012_2140"
require "codesake/dawn/kb/cve_2012_2660"
require "codesake/dawn/kb/cve_2012_2661"
require "codesake/dawn/kb/cve_2012_2671"
require "codesake/dawn/kb/cve_2012_2694"
require "codesake/dawn/kb/cve_2012_2695"
require "codesake/dawn/kb/cve_2012_3424"
require "codesake/dawn/kb/cve_2012_3463"
require "codesake/dawn/kb/cve_2012_3464"
require "codesake/dawn/kb/cve_2012_3465"
require "codesake/dawn/kb/cve_2012_4464"
require "codesake/dawn/kb/cve_2012_4466"
require "codesake/dawn/kb/cve_2012_4481"
require "codesake/dawn/kb/cve_2012_4522"
require "codesake/dawn/kb/cve_2012_5370"
require "codesake/dawn/kb/cve_2012_5371"
require "codesake/dawn/kb/cve_2012_5380"
require "codesake/dawn/kb/cve_2012_6109"
require "codesake/dawn/kb/cve_2012_6134"
require "codesake/dawn/kb/cve_2012_6496"
require "codesake/dawn/kb/cve_2012_6497"

# CVE - 2013
require "codesake/dawn/kb/cve_2013_0155"
require "codesake/dawn/kb/cve_2013_0156"
require "codesake/dawn/kb/cve_2013_0162"
require "codesake/dawn/kb/cve_2013_0175"
require "codesake/dawn/kb/cve_2013_0183"
require "codesake/dawn/kb/cve_2013_0184"
require "codesake/dawn/kb/cve_2013_0233"
require "codesake/dawn/kb/cve_2013_0256"
require "codesake/dawn/kb/cve_2013_0262"
require "codesake/dawn/kb/cve_2013_0263"
require "codesake/dawn/kb/cve_2013_0269"
require "codesake/dawn/kb/cve_2013_0276"
require "codesake/dawn/kb/cve_2013_0277"
require "codesake/dawn/kb/cve_2013_0284"
require "codesake/dawn/kb/cve_2013_0285"
require "codesake/dawn/kb/cve_2013_0333"
require "codesake/dawn/kb/cve_2013_1607"
require "codesake/dawn/kb/cve_2013_1655"
require "codesake/dawn/kb/cve_2013_1656"
require "codesake/dawn/kb/cve_2013_1756"
require "codesake/dawn/kb/cve_2013_1800"
require "codesake/dawn/kb/cve_2013_1801"
require "codesake/dawn/kb/cve_2013_1802"
require "codesake/dawn/kb/cve_2013_1812"
require "codesake/dawn/kb/cve_2013_1821"
require "codesake/dawn/kb/cve_2013_1854"
require "codesake/dawn/kb/cve_2013_1855"
require "codesake/dawn/kb/cve_2013_1856"
require "codesake/dawn/kb/cve_2013_1857"
require "codesake/dawn/kb/cve_2013_1875"
require "codesake/dawn/kb/cve_2013_1898"
require "codesake/dawn/kb/cve_2013_1911"
require "codesake/dawn/kb/cve_2013_1933"
require "codesake/dawn/kb/cve_2013_1947"
require "codesake/dawn/kb/cve_2013_1948"
require "codesake/dawn/kb/cve_2013_2065"
require "codesake/dawn/kb/cve_2013_2090"
require "codesake/dawn/kb/cve_2013_2119"
require "codesake/dawn/kb/cve_2013_2512"
require "codesake/dawn/kb/cve_2013_2513"
require "codesake/dawn/kb/cve_2013_2516"
require "codesake/dawn/kb/cve_2013_2615"
require "codesake/dawn/kb/cve_2013_2616"
require "codesake/dawn/kb/cve_2013_2617"
require "codesake/dawn/kb/cve_2013_3221"
require "codesake/dawn/kb/cve_2013_4164"
require "codesake/dawn/kb/cve_2013_4203"
require "codesake/dawn/kb/cve_2013_4389"
require "codesake/dawn/kb/cve_2013_4413"
require "codesake/dawn/kb/cve_2013_4457"
require "codesake/dawn/kb/cve_2013_4478"
require "codesake/dawn/kb/cve_2013_4479"
require "codesake/dawn/kb/cve_2013_4489"
require "codesake/dawn/kb/cve_2013_4491"
require "codesake/dawn/kb/cve_2013_4492"
require "codesake/dawn/kb/cve_2013_4562"
require "codesake/dawn/kb/cve_2013_4593"
require "codesake/dawn/kb/cve_2013_5647"
require "codesake/dawn/kb/cve_2013_5671"
require "codesake/dawn/kb/cve_2013_6414"
require "codesake/dawn/kb/cve_2013_6415"
require "codesake/dawn/kb/cve_2013_6416"
require "codesake/dawn/kb/cve_2013_6417"
require "codesake/dawn/kb/cve_2013_6421"
require "codesake/dawn/kb/cve_2013_6459"
require "codesake/dawn/kb/cve_2013_6460"
require "codesake/dawn/kb/cve_2013_6461"
require "codesake/dawn/kb/cve_2013_7086"

# CVE - 2014

require "codesake/dawn/kb/cve_2014_0036"
require "codesake/dawn/kb/cve_2014_0080"
require "codesake/dawn/kb/cve_2014_0081"
require "codesake/dawn/kb/cve_2014_0082"
require "codesake/dawn/kb/cve_2014_0130"
require "codesake/dawn/kb/cve_2014_1233"
require "codesake/dawn/kb/cve_2014_1234"
require "codesake/dawn/kb/cve_2014_2322"
require "codesake/dawn/kb/cve_2014_2525"
require "codesake/dawn/kb/cve_2014_2538"

# OSVDB

require "codesake/dawn/kb/osvdb_105971"


module Codesake
  module Dawn
    # XXX: Check if it best using a singleton here
    class KnowledgeBase

      include Codesake::Dawn::Utils

      DEPENDENCY_CHECK    = :dependency_check
      PATTERN_MATCH_CHECK = :pattern_match_check
      RUBY_VERSION_CHECK  = :ruby_version_check
      OS_CHECK            = :os_check
      COMBO_CHECK         = :combo_check
      CUSTOM_CHECK        = :custom_check

      def initialize(options={})
        @enabled_checks = Codesake::Dawn::Kb::BasicCheck::ALLOWED_FAMILIES
        @enabled_checks = options[:enabled_checks] unless options[:enabled_checks].nil?

        @security_checks = load_security_checks
      end

      def self.find(checks=nil, name)
        return nil if name.nil? or name.empty?
        checks = Codesake::Dawn::KnowledgeBase.new.load_security_checks if checks.nil?

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

      # TODO - next big refactoring will include also a change in this API.
      #
      # So to match Semantic Version, it must bring to a major version bump.
      # MVC name should be passed as constructor option, so the all_by_mvc can
      #
      # be called without parameter, having a nice-to-read code.
      # @checks = Codesake::Dawn::KnowledgeBase.new({:enabled_checks=>@enabled_checks}).all_by_mvc(@name)
      def all_by_mvc(mvc)
        ret = []
        @security_checks.each do |sc|
          ret << sc if sc.applies_to?(mvc)
        end
        ret
      end

      def all_sinatra_checks
        self.all_by_mvc("sinatra")
      end

      def all_rails_checks
        self.all_by_mvc("rails")
      end

      def all_padrino_checks
        self.all_by_mvc("padrino")
      end

      def all_rack_checks
        self.all_by_mvc("rack")
      end

      def load_security_checks

        # START @cve_security_checks array
        @cve_security_checks =
        [
          Codesake::Dawn::Kb::CVE_2004_0755.new,
          Codesake::Dawn::Kb::CVE_2004_0983.new,
          Codesake::Dawn::Kb::CVE_2005_1992.new,
          Codesake::Dawn::Kb::CVE_2005_2337.new,
          Codesake::Dawn::Kb::CVE_2006_1931.new,
          Codesake::Dawn::Kb::CVE_2006_2582.new,
          Codesake::Dawn::Kb::CVE_2006_3694.new,
          Codesake::Dawn::Kb::CVE_2006_4112.new,
          Codesake::Dawn::Kb::CVE_2006_5467.new,
          Codesake::Dawn::Kb::CVE_2006_6303.new,
          Codesake::Dawn::Kb::CVE_2006_6852.new,
          Codesake::Dawn::Kb::CVE_2006_6979.new,
          Codesake::Dawn::Kb::CVE_2007_0469.new,
          Codesake::Dawn::Kb::CVE_2007_5162.new,
          Codesake::Dawn::Kb::CVE_2007_5379.new,
          Codesake::Dawn::Kb::CVE_2007_5380.new,
          Codesake::Dawn::Kb::CVE_2007_5770.new,
          Codesake::Dawn::Kb::CVE_2007_6077.new,
          Codesake::Dawn::Kb::CVE_2007_6612.new,
          Codesake::Dawn::Kb::CVE_2008_1145.new,
          Codesake::Dawn::Kb::CVE_2008_1891.new,
          Codesake::Dawn::Kb::CVE_2008_2376.new,
          Codesake::Dawn::Kb::CVE_2008_2662.new,
          Codesake::Dawn::Kb::CVE_2008_2663.new,
          Codesake::Dawn::Kb::CVE_2008_2664.new,
          Codesake::Dawn::Kb::CVE_2008_2725.new,
          Codesake::Dawn::Kb::CVE_2008_3655.new,
          Codesake::Dawn::Kb::CVE_2008_3657.new,
          Codesake::Dawn::Kb::CVE_2008_3790.new,
          Codesake::Dawn::Kb::CVE_2008_3905.new,
          Codesake::Dawn::Kb::CVE_2008_4094.new,
          Codesake::Dawn::Kb::CVE_2008_4310.new,
          Codesake::Dawn::Kb::CVE_2008_5189.new,
          Codesake::Dawn::Kb::CVE_2008_7248.new,
          Codesake::Dawn::Kb::CVE_2009_4078.new,
          Codesake::Dawn::Kb::CVE_2009_4124.new,
          Codesake::Dawn::Kb::CVE_2009_4214.new,
          Codesake::Dawn::Kb::CVE_2010_1330.new,
          Codesake::Dawn::Kb::CVE_2010_2489.new,
          Codesake::Dawn::Kb::CVE_2010_3933.new,
          Codesake::Dawn::Kb::CVE_2011_0188.new,
          Codesake::Dawn::Kb::CVE_2011_0446.new,
          Codesake::Dawn::Kb::CVE_2011_0447.new,
          Codesake::Dawn::Kb::CVE_2011_0739.new,
          Codesake::Dawn::Kb::CVE_2011_0995.new,
          Codesake::Dawn::Kb::CVE_2011_1004.new,
          Codesake::Dawn::Kb::CVE_2011_1005.new,
          Codesake::Dawn::Kb::CVE_2011_2197.new,
          Codesake::Dawn::Kb::CVE_2011_2686.new,
          Codesake::Dawn::Kb::CVE_2011_2705.new,
          Codesake::Dawn::Kb::CVE_2011_2929.new,
          Codesake::Dawn::Kb::CVE_2011_2930.new,
          Codesake::Dawn::Kb::CVE_2011_2931.new,
          Codesake::Dawn::Kb::CVE_2011_2932.new,
          Codesake::Dawn::Kb::CVE_2011_3009.new,
          Codesake::Dawn::Kb::CVE_2011_3186.new,
          Codesake::Dawn::Kb::CVE_2011_3187.new,
          Codesake::Dawn::Kb::CVE_2011_4319.new,
          Codesake::Dawn::Kb::CVE_2011_4815.new,
          Codesake::Dawn::Kb::CVE_2011_5036.new,
          Codesake::Dawn::Kb::CVE_2012_1098.new,
          Codesake::Dawn::Kb::CVE_2012_1099.new,
          Codesake::Dawn::Kb::CVE_2012_1241.new,
          Codesake::Dawn::Kb::CVE_2012_2139.new,
          Codesake::Dawn::Kb::CVE_2012_2140.new,
          Codesake::Dawn::Kb::CVE_2012_2660.new,
          Codesake::Dawn::Kb::CVE_2012_2661.new,
          Codesake::Dawn::Kb::CVE_2012_2671.new,
          Codesake::Dawn::Kb::CVE_2012_2694.new,
          Codesake::Dawn::Kb::CVE_2012_2695.new,
          Codesake::Dawn::Kb::CVE_2012_3424.new,
          Codesake::Dawn::Kb::CVE_2012_3463.new,
          Codesake::Dawn::Kb::CVE_2012_3464.new,
          Codesake::Dawn::Kb::CVE_2012_3465.new,
          Codesake::Dawn::Kb::CVE_2012_4464.new,
          Codesake::Dawn::Kb::CVE_2012_4466.new,
          Codesake::Dawn::Kb::CVE_2012_4481.new,
          Codesake::Dawn::Kb::CVE_2012_4522.new,
          Codesake::Dawn::Kb::CVE_2012_5370.new,
          Codesake::Dawn::Kb::CVE_2012_5371.new,
          Codesake::Dawn::Kb::CVE_2012_5380.new,
          Codesake::Dawn::Kb::CVE_2012_6109.new,
          Codesake::Dawn::Kb::CVE_2012_6134.new,
          Codesake::Dawn::Kb::CVE_2012_6496.new,
          Codesake::Dawn::Kb::CVE_2012_6497.new,
          Codesake::Dawn::Kb::CVE_2013_0155.new,
          Codesake::Dawn::Kb::CVE_2013_0156.new,
          Codesake::Dawn::Kb::CVE_2013_0162.new,
          Codesake::Dawn::Kb::CVE_2013_0175.new,
          Codesake::Dawn::Kb::CVE_2013_0183.new,
          Codesake::Dawn::Kb::CVE_2013_0184.new,
          Codesake::Dawn::Kb::CVE_2013_0233.new,
          Codesake::Dawn::Kb::CVE_2013_0256.new,
          Codesake::Dawn::Kb::CVE_2013_0262.new,
          Codesake::Dawn::Kb::CVE_2013_0263.new,
          Codesake::Dawn::Kb::CVE_2013_0269.new,
          Codesake::Dawn::Kb::CVE_2013_0276.new,
          Codesake::Dawn::Kb::CVE_2013_0277.new,
          Codesake::Dawn::Kb::CVE_2013_0284.new,
          Codesake::Dawn::Kb::CVE_2013_0285.new,
          Codesake::Dawn::Kb::CVE_2013_0333.new,
          Codesake::Dawn::Kb::CVE_2013_1607.new,
          Codesake::Dawn::Kb::CVE_2013_1655.new,
          Codesake::Dawn::Kb::CVE_2013_1656.new,
          Codesake::Dawn::Kb::CVE_2013_1756.new,
          Codesake::Dawn::Kb::CVE_2013_1800.new,
          Codesake::Dawn::Kb::CVE_2013_1801.new,
          Codesake::Dawn::Kb::CVE_2013_1802.new,
          Codesake::Dawn::Kb::CVE_2013_1812.new,
          Codesake::Dawn::Kb::CVE_2013_1821.new,
          Codesake::Dawn::Kb::CVE_2013_1854.new,
          Codesake::Dawn::Kb::CVE_2013_1855.new,
          Codesake::Dawn::Kb::CVE_2013_1856.new,
          Codesake::Dawn::Kb::CVE_2013_1857.new,
          Codesake::Dawn::Kb::CVE_2013_1875.new,
          Codesake::Dawn::Kb::CVE_2013_1898.new,
          Codesake::Dawn::Kb::CVE_2013_1911.new,
          Codesake::Dawn::Kb::CVE_2013_1933.new,
          Codesake::Dawn::Kb::CVE_2013_1947.new,
          Codesake::Dawn::Kb::CVE_2013_1948.new,
          Codesake::Dawn::Kb::CVE_2013_2065.new,
          Codesake::Dawn::Kb::CVE_2013_2090.new,
          Codesake::Dawn::Kb::CVE_2013_2119.new,
          Codesake::Dawn::Kb::CVE_2013_2512.new,
          Codesake::Dawn::Kb::CVE_2013_2513.new,
          Codesake::Dawn::Kb::CVE_2013_2516.new,
          Codesake::Dawn::Kb::CVE_2013_2615.new,
          Codesake::Dawn::Kb::CVE_2013_2616.new,
          Codesake::Dawn::Kb::CVE_2013_2617.new,
          Codesake::Dawn::Kb::CVE_2013_3221.new,
          Codesake::Dawn::Kb::CVE_2013_4164.new,
          Codesake::Dawn::Kb::CVE_2013_4203.new,
          Codesake::Dawn::Kb::CVE_2013_4389.new,
          Codesake::Dawn::Kb::CVE_2013_4413.new,
          Codesake::Dawn::Kb::CVE_2013_4457.new,
          Codesake::Dawn::Kb::CVE_2013_4478.new,
          Codesake::Dawn::Kb::CVE_2013_4479.new,
          Codesake::Dawn::Kb::CVE_2013_4489.new,
          Codesake::Dawn::Kb::CVE_2013_4491.new,
          Codesake::Dawn::Kb::CVE_2013_4492.new,
          Codesake::Dawn::Kb::CVE_2013_4562.new,
          Codesake::Dawn::Kb::CVE_2013_4593.new,
          Codesake::Dawn::Kb::CVE_2013_5647.new,
          Codesake::Dawn::Kb::CVE_2013_5671.new,
          Codesake::Dawn::Kb::CVE_2013_6414.new,
          Codesake::Dawn::Kb::CVE_2013_6415.new,
          Codesake::Dawn::Kb::CVE_2013_6416.new,
          Codesake::Dawn::Kb::CVE_2013_6417.new,
          Codesake::Dawn::Kb::CVE_2013_6421.new,
          Codesake::Dawn::Kb::CVE_2013_6459.new,
          Codesake::Dawn::Kb::CVE_2013_6460.new,
          Codesake::Dawn::Kb::CVE_2013_6461.new,
          Codesake::Dawn::Kb::CVE_2013_7086.new,
          Codesake::Dawn::Kb::CVE_2014_0036.new,
          Codesake::Dawn::Kb::CVE_2014_0080.new,
          Codesake::Dawn::Kb::CVE_2014_0081.new,
          Codesake::Dawn::Kb::CVE_2014_0082.new,
          Codesake::Dawn::Kb::CVE_2014_0130.new,
          Codesake::Dawn::Kb::CVE_2014_1233.new,
          Codesake::Dawn::Kb::CVE_2014_1234.new,
          Codesake::Dawn::Kb::CVE_2014_2322.new,
          Codesake::Dawn::Kb::CVE_2014_2525.new,
          Codesake::Dawn::Kb::CVE_2014_2538.new,

          # OSVDB Checks are still here since are all about dependencies
          Codesake::Dawn::Kb::OSVDB_105971.new
        ]
        # END @cve_security_checks array
        # START @owasp_ror_cheatsheet_checks array
        @owasp_ror_cheatsheet_checks = [
          Codesake::Dawn::Kb::OwaspRorCheatSheet::CommandInjection.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::Csrf.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::SessionStoredInDatabase.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::MassAssignmentInModel.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::SecurityRelatedHeaders.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::CheckForSafeRedirectAndForward.new,
          Codesake::Dawn::Kb::OwaspRorCheatSheet::SensitiveFiles.new,
        ]
        # END @owasp_ror_cheatsheet_checks array
        @code_quality_checks = [
          Codesake::Dawn::Kb::NotRevisedCode.new,
        ]
        @aux_checks =
        [
          Codesake::Dawn::Kb::SimpleForm_Xss_20131129.new,
        ]

        ret = []
        ret += @aux_checks
        ret += @cve_security_checks         if @enabled_checks.include?(:cve_bulletin)
        ret += @owasp_ror_cheatsheet_checks if @enabled_checks.include?(:owasp_ror_cheatsheet)
        ret += @code_quality_checks         if @enabled_checks.include?(:code_quality)

        ret
      end
    end

  end
end
