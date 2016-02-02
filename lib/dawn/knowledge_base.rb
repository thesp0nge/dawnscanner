# Core KB
require "dawn/kb/basic_check"
require "dawn/kb/pattern_match_check"
require "dawn/kb/dependency_check"
require "dawn/kb/ruby_version_check"
require "dawn/kb/operating_system_check"
require "dawn/kb/combo_check"
require "dawn/kb/version_check"
require "dawn/kb/deprecation_check"
require "dawn/kb/gem_check"

# Q&A related checks
## Not revised code
require "dawn/kb/not_revised_code"

## Owasp ROR Cheatsheet
require 'dawn/kb/owasp_ror_cheatsheet/command_injection'
require 'dawn/kb/owasp_ror_cheatsheet/csrf'
require 'dawn/kb/owasp_ror_cheatsheet/session_stored_in_database'
require 'dawn/kb/owasp_ror_cheatsheet/mass_assignment_in_model'
require 'dawn/kb/owasp_ror_cheatsheet/security_related_headers'
require 'dawn/kb/owasp_ror_cheatsheet/check_for_safe_redirect_and_forward'
require 'dawn/kb/owasp_ror_cheatsheet/sensitive_files'

# Security checks with no or pending CVE

# A XSS issue on Simple Form gem reported by Rafael Mendonça França on
# November, 29 2013
#
# https://groups.google.com/forum/#!topic/ruby-security-ann/flHbLMb07tE
require "dawn/kb/simpleform_xss_20131129"

# CVE - 2004
require "dawn/kb/cve_2004_0755"
require "dawn/kb/cve_2004_0983"

# CVE - 2005
require "dawn/kb/cve_2005_1992"
require "dawn/kb/cve_2005_2337"

# CVE - 2006
require "dawn/kb/cve_2006_1931"
require "dawn/kb/cve_2006_2582"
require "dawn/kb/cve_2006_3694"
require "dawn/kb/cve_2006_4112"
require "dawn/kb/cve_2006_5467"
require "dawn/kb/cve_2006_6303"
require "dawn/kb/cve_2006_6852"
require "dawn/kb/cve_2006_6979"

# CVE - 2007
require "dawn/kb/cve_2007_0469"
require "dawn/kb/cve_2007_5162"
require "dawn/kb/cve_2007_5379"
require "dawn/kb/cve_2007_5380"
require "dawn/kb/cve_2007_5770"
require "dawn/kb/cve_2007_6077"
require "dawn/kb/cve_2007_6612"

# CVE - 2008

require "dawn/kb/cve_2008_1145"
require "dawn/kb/cve_2008_1891"
require "dawn/kb/cve_2008_2376"
require "dawn/kb/cve_2008_2662"
require "dawn/kb/cve_2008_2663"
require "dawn/kb/cve_2008_2664"
require "dawn/kb/cve_2008_2725"
require "dawn/kb/cve_2008_3655"
require "dawn/kb/cve_2008_3657"
require "dawn/kb/cve_2008_3790"
require "dawn/kb/cve_2008_3905"
require "dawn/kb/cve_2008_4094"
require "dawn/kb/cve_2008_4310"
require "dawn/kb/cve_2008_5189"
require "dawn/kb/cve_2008_7248"

# CVE - 2009
require "dawn/kb/cve_2009_4078"
require "dawn/kb/cve_2009_4124"
require "dawn/kb/cve_2009_4214"

# CVE - 2010
require "dawn/kb/cve_2010_1330"
require "dawn/kb/cve_2010_2489"
require "dawn/kb/cve_2010_3933"

# CVE - 2011
require "dawn/kb/cve_2011_0188"
require "dawn/kb/cve_2011_0446"
require "dawn/kb/cve_2011_0447"
require "dawn/kb/cve_2011_0739"
require "dawn/kb/cve_2011_0995"
require "dawn/kb/cve_2011_1004"
require "dawn/kb/cve_2011_1005"
require "dawn/kb/cve_2011_2197"
require "dawn/kb/cve_2011_2686"
require "dawn/kb/cve_2011_2705"
require "dawn/kb/cve_2011_2929"
require "dawn/kb/cve_2011_2930"
require "dawn/kb/cve_2011_2931"
require "dawn/kb/cve_2011_2932"
require "dawn/kb/cve_2011_3009"
require "dawn/kb/cve_2011_3186"
require "dawn/kb/cve_2011_3187"
require "dawn/kb/cve_2011_4319"
require "dawn/kb/cve_2011_4815"
require "dawn/kb/cve_2011_5036"

# CVE - 2012
require "dawn/kb/cve_2012_1098"
require "dawn/kb/cve_2012_1099"
require "dawn/kb/cve_2012_1241"
require "dawn/kb/cve_2012_2139"
require "dawn/kb/cve_2012_2140"
require "dawn/kb/cve_2012_2660"
require "dawn/kb/cve_2012_2661"
require "dawn/kb/cve_2012_2671"
require "dawn/kb/cve_2012_2694"
require "dawn/kb/cve_2012_2695"
require "dawn/kb/cve_2012_3424"
require "dawn/kb/cve_2012_3463"
require "dawn/kb/cve_2012_3464"
require "dawn/kb/cve_2012_3465"
require "dawn/kb/cve_2012_4464"
require "dawn/kb/cve_2012_4466"
require "dawn/kb/cve_2012_4481"
require "dawn/kb/cve_2012_4522"
require "dawn/kb/cve_2012_5370"
require "dawn/kb/cve_2012_5371"
require "dawn/kb/cve_2012_5380"
require "dawn/kb/cve_2012_6109"
require "dawn/kb/cve_2012_6134"
require "dawn/kb/cve_2012_6496"
require "dawn/kb/cve_2012_6497"
require "dawn/kb/cve_2012_6684"

# CVE - 2013
require "dawn/kb/cve_2013_0155"
require "dawn/kb/cve_2013_0156"
require "dawn/kb/cve_2013_0162"
require "dawn/kb/cve_2013_0175"
require "dawn/kb/cve_2013_0183"
require "dawn/kb/cve_2013_0184"
require "dawn/kb/cve_2013_0233"
require "dawn/kb/cve_2013_0256"
require "dawn/kb/cve_2013_0262"
require "dawn/kb/cve_2013_0263"
require "dawn/kb/cve_2013_0269"
require "dawn/kb/cve_2013_0276"
require "dawn/kb/cve_2013_0277"
require "dawn/kb/cve_2013_0284"
require "dawn/kb/cve_2013_0285"
require "dawn/kb/cve_2013_0333"
require "dawn/kb/cve_2013_1607"
require "dawn/kb/cve_2013_1655"
require "dawn/kb/cve_2013_1656"
require "dawn/kb/cve_2013_1756"
require "dawn/kb/cve_2013_1800"
require "dawn/kb/cve_2013_1801"
require "dawn/kb/cve_2013_1802"
require "dawn/kb/cve_2013_1812"
require "dawn/kb/cve_2013_1821"
require "dawn/kb/cve_2013_1854"
require "dawn/kb/cve_2013_1855"
require "dawn/kb/cve_2013_1856"
require "dawn/kb/cve_2013_1857"
require "dawn/kb/cve_2013_1875"
require "dawn/kb/cve_2013_1898"
require "dawn/kb/cve_2013_1911"
require "dawn/kb/cve_2013_1933"
require "dawn/kb/cve_2013_1947"
require "dawn/kb/cve_2013_1948"
require "dawn/kb/cve_2013_2065"
require "dawn/kb/cve_2013_2090"
require "dawn/kb/cve_2013_2105"
require "dawn/kb/cve_2013_2119"
require "dawn/kb/cve_2013_2512"
require "dawn/kb/cve_2013_2513"
require "dawn/kb/cve_2013_2516"
require "dawn/kb/cve_2013_2615"
require "dawn/kb/cve_2013_2616"
require "dawn/kb/cve_2013_2617"
require "dawn/kb/cve_2013_3221"
require "dawn/kb/cve_2013_4164"
require "dawn/kb/cve_2013_4203"
require "dawn/kb/cve_2013_4389"
require "dawn/kb/cve_2013_4413"
require "dawn/kb/cve_2013_4457"
require "dawn/kb/cve_2013_4478"
require "dawn/kb/cve_2013_4479"
require "dawn/kb/cve_2013_4489"
require "dawn/kb/cve_2013_4491"
require "dawn/kb/cve_2013_4492"
require "dawn/kb/cve_2013_4562"
require "dawn/kb/cve_2013_4593"
require "dawn/kb/cve_2013_5647"
require "dawn/kb/cve_2013_5671"
require "dawn/kb/cve_2013_6414"
require "dawn/kb/cve_2013_6415"
require "dawn/kb/cve_2013_6416"
require "dawn/kb/cve_2013_6417"
require "dawn/kb/cve_2013_6421"
require "dawn/kb/cve_2013_6459"
require "dawn/kb/cve_2013_6460"
require "dawn/kb/cve_2013_6461"
require "dawn/kb/cve_2013_7086"

# CVE - 2014

require "dawn/kb/cve_2014_0036"
require "dawn/kb/cve_2014_0080"
require "dawn/kb/cve_2014_0081"
require "dawn/kb/cve_2014_0082"
require "dawn/kb/cve_2014_0130"
require "dawn/kb/cve_2014_1233"
require "dawn/kb/cve_2014_1234"
require "dawn/kb/cve_2014_2322"
require "dawn/kb/cve_2014_2525"
require "dawn/kb/cve_2014_2538"
require "dawn/kb/cve_2014_3482"
require "dawn/kb/cve_2014_3483"
require "dawn/kb/cve_2014_3916"
require "dawn/kb/cve_2014_4975"
require "dawn/kb/cve_2014_7818"
require "dawn/kb/cve_2014_7819"
require "dawn/kb/cve_2014_7829"
require "dawn/kb/cve_2014_8090"
require "dawn/kb/cve_2014_9490"

# CVE - 2015


require "dawn/kb/cve_2015_1819"
# CVE-2015-1840 is spread in two classes because a single CVE is assigned to a
# vulnerability affecting two differents but related gems.
require "dawn/kb/cve_2015_1840/cve_2015_1840_a"
require "dawn/kb/cve_2015_1840/cve_2015_1840_b"
require "dawn/kb/cve_2015_2963"
require "dawn/kb/cve_2015_3224"
require "dawn/kb/cve_2015_3225"
require "dawn/kb/cve_2015_3226"
require "dawn/kb/cve_2015_3227"
require "dawn/kb/cve_2015_3448"
require "dawn/kb/cve_2015_4020"
require "dawn/kb/cve_2015_5312"
require "dawn/kb/cve_2015_7497"
require "dawn/kb/cve_2015_7498"
require "dawn/kb/cve_2015_7499"
require "dawn/kb/cve_2015_7500"
require "dawn/kb/cve_2015_7519"
require "dawn/kb/cve_2015_7541"
require "dawn/kb/cve_2015_7576"
require "dawn/kb/cve_2015_7577"
require "dawn/kb/cve_2015_7578"
require "dawn/kb/cve_2015_7579"
require "dawn/kb/cve_2015_7581"
require "dawn/kb/cve_2015_8241"
require "dawn/kb/cve_2015_8242"
require "dawn/kb/cve_2015_8317"

# CVE - 2016

require "dawn/kb/cve_2016_0751"
require "dawn/kb/cve_2016_0752"
require "dawn/kb/cve_2016_0753"

# OSVDB

require "dawn/kb/osvdb_105971"
require "dawn/kb/osvdb_108569"
require "dawn/kb/osvdb_108570"
require "dawn/kb/osvdb_108530"
require "dawn/kb/osvdb_108563"
require "dawn/kb/osvdb_115654"
require "dawn/kb/osvdb_116010"
require "dawn/kb/osvdb_117903"
require "dawn/kb/osvdb_118579"
require "dawn/kb/osvdb_118830"
require "dawn/kb/osvdb_118954"
require "dawn/kb/osvdb_119878"
require "dawn/kb/osvdb_119927"
require "dawn/kb/osvdb_120415"
require "dawn/kb/osvdb_120857"
require "dawn/kb/osvdb_121701"



module Dawn
  # XXX: Check if it best using a singleton here
  class KnowledgeBase

    include Dawn::Utils

    GEM_CHECK           = :rubygem_check
    DEPENDENCY_CHECK    = :dependency_check
    PATTERN_MATCH_CHECK = :pattern_match_check
    RUBY_VERSION_CHECK  = :ruby_version_check
    OS_CHECK            = :os_check
    COMBO_CHECK         = :combo_check
    CUSTOM_CHECK        = :custom_check

    def initialize(options={})
      @enabled_checks = Dawn::Kb::BasicCheck::ALLOWED_FAMILIES
      @enabled_checks = options[:enabled_checks] unless options[:enabled_checks].nil?

      @security_checks = load_security_checks
    end

    def self.find(checks=nil, name)
      return nil if name.nil? or name.empty?
      checks = Dawn::KnowledgeBase.new.load_security_checks if checks.nil?

      checks.each do |sc|
        return sc if sc.name == name
      end
      nil
    end

    def find(name)
      Dawn::KnowledgeBase.find(@security_checks, name)
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
    # @checks = Dawn::KnowledgeBase.new({:enabled_checks=>@enabled_checks}).all_by_mvc(@name)
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
          Dawn::Kb::CVE_2004_0755.new,
          Dawn::Kb::CVE_2004_0983.new,
          Dawn::Kb::CVE_2005_1992.new,
          Dawn::Kb::CVE_2005_2337.new,
          Dawn::Kb::CVE_2006_1931.new,
          Dawn::Kb::CVE_2006_2582.new,
          Dawn::Kb::CVE_2006_3694.new,
          Dawn::Kb::CVE_2006_4112.new,
          Dawn::Kb::CVE_2006_5467.new,
          Dawn::Kb::CVE_2006_6303.new,
          Dawn::Kb::CVE_2006_6852.new,
          Dawn::Kb::CVE_2006_6979.new,
          Dawn::Kb::CVE_2007_0469.new,
          Dawn::Kb::CVE_2007_5162.new,
          Dawn::Kb::CVE_2007_5379.new,
          Dawn::Kb::CVE_2007_5380.new,
          Dawn::Kb::CVE_2007_5770.new,
          Dawn::Kb::CVE_2007_6077.new,
          Dawn::Kb::CVE_2007_6612.new,
          Dawn::Kb::CVE_2008_1145.new,
          Dawn::Kb::CVE_2008_1891.new,
          Dawn::Kb::CVE_2008_2376.new,
          Dawn::Kb::CVE_2008_2662.new,
          Dawn::Kb::CVE_2008_2663.new,
          Dawn::Kb::CVE_2008_2664.new,
          Dawn::Kb::CVE_2008_2725.new,
          Dawn::Kb::CVE_2008_3655.new,
          Dawn::Kb::CVE_2008_3657.new,
          Dawn::Kb::CVE_2008_3790.new,
          Dawn::Kb::CVE_2008_3905.new,
          Dawn::Kb::CVE_2008_4094.new,
          Dawn::Kb::CVE_2008_4310.new,
          Dawn::Kb::CVE_2008_5189.new,
          Dawn::Kb::CVE_2008_7248.new,
          Dawn::Kb::CVE_2009_4078.new,
          Dawn::Kb::CVE_2009_4124.new,
          Dawn::Kb::CVE_2009_4214.new,
          Dawn::Kb::CVE_2010_1330.new,
          Dawn::Kb::CVE_2010_2489.new,
          Dawn::Kb::CVE_2010_3933.new,
          Dawn::Kb::CVE_2011_0188.new,
          Dawn::Kb::CVE_2011_0446.new,
          Dawn::Kb::CVE_2011_0447.new,
          Dawn::Kb::CVE_2011_0739.new,
          Dawn::Kb::CVE_2011_0995.new,
          Dawn::Kb::CVE_2011_1004.new,
          Dawn::Kb::CVE_2011_1005.new,
          Dawn::Kb::CVE_2011_2197.new,
          Dawn::Kb::CVE_2011_2686.new,
          Dawn::Kb::CVE_2011_2705.new,
          Dawn::Kb::CVE_2011_2929.new,
          Dawn::Kb::CVE_2011_2930.new,
          Dawn::Kb::CVE_2011_2931.new,
          Dawn::Kb::CVE_2011_2932.new,
          Dawn::Kb::CVE_2011_3009.new,
          Dawn::Kb::CVE_2011_3186.new,
          Dawn::Kb::CVE_2011_3187.new,
          Dawn::Kb::CVE_2011_4319.new,
          Dawn::Kb::CVE_2011_4815.new,
          Dawn::Kb::CVE_2011_5036.new,
          Dawn::Kb::CVE_2012_1098.new,
          Dawn::Kb::CVE_2012_1099.new,
          Dawn::Kb::CVE_2012_1241.new,
          Dawn::Kb::CVE_2012_2139.new,
          Dawn::Kb::CVE_2012_2140.new,
          Dawn::Kb::CVE_2012_2660.new,
          Dawn::Kb::CVE_2012_2661.new,
          Dawn::Kb::CVE_2012_2671.new,
          Dawn::Kb::CVE_2012_2694.new,
          Dawn::Kb::CVE_2012_2695.new,
          Dawn::Kb::CVE_2012_3424.new,
          Dawn::Kb::CVE_2012_3463.new,
          Dawn::Kb::CVE_2012_3464.new,
          Dawn::Kb::CVE_2012_3465.new,
          Dawn::Kb::CVE_2012_4464.new,
          Dawn::Kb::CVE_2012_4466.new,
          Dawn::Kb::CVE_2012_4481.new,
          Dawn::Kb::CVE_2012_4522.new,
          Dawn::Kb::CVE_2012_5370.new,
          Dawn::Kb::CVE_2012_5371.new,
          Dawn::Kb::CVE_2012_5380.new,
          Dawn::Kb::CVE_2012_6109.new,
          Dawn::Kb::CVE_2012_6134.new,
          Dawn::Kb::CVE_2012_6496.new,
          Dawn::Kb::CVE_2012_6497.new,
          Dawn::Kb::CVE_2012_6684.new,
          Dawn::Kb::CVE_2013_0155.new,
          Dawn::Kb::CVE_2013_0156.new,
          Dawn::Kb::CVE_2013_0162.new,
          Dawn::Kb::CVE_2013_0175.new,
          Dawn::Kb::CVE_2013_0183.new,
          Dawn::Kb::CVE_2013_0184.new,
          Dawn::Kb::CVE_2013_0233.new,
          Dawn::Kb::CVE_2013_0256.new,
          Dawn::Kb::CVE_2013_0262.new,
          Dawn::Kb::CVE_2013_0263.new,
          Dawn::Kb::CVE_2013_0269.new,
          Dawn::Kb::CVE_2013_0276.new,
          Dawn::Kb::CVE_2013_0277.new,
          Dawn::Kb::CVE_2013_0284.new,
          Dawn::Kb::CVE_2013_0285.new,
          Dawn::Kb::CVE_2013_0333.new,
          Dawn::Kb::CVE_2013_1607.new,
          Dawn::Kb::CVE_2013_1655.new,
          Dawn::Kb::CVE_2013_1656.new,
          Dawn::Kb::CVE_2013_1756.new,
          Dawn::Kb::CVE_2013_1800.new,
          Dawn::Kb::CVE_2013_1801.new,
          Dawn::Kb::CVE_2013_1802.new,
          Dawn::Kb::CVE_2013_1812.new,
          Dawn::Kb::CVE_2013_1821.new,
          Dawn::Kb::CVE_2013_1854.new,
          Dawn::Kb::CVE_2013_1855.new,
          Dawn::Kb::CVE_2013_1856.new,
          Dawn::Kb::CVE_2013_1857.new,
          Dawn::Kb::CVE_2013_1875.new,
          Dawn::Kb::CVE_2013_1898.new,
          Dawn::Kb::CVE_2013_1911.new,
          Dawn::Kb::CVE_2013_1933.new,
          Dawn::Kb::CVE_2013_1947.new,
          Dawn::Kb::CVE_2013_1948.new,
          Dawn::Kb::CVE_2013_2065.new,
          Dawn::Kb::CVE_2013_2090.new,
          Dawn::Kb::CVE_2013_2105.new,
          Dawn::Kb::CVE_2013_2119.new,
          Dawn::Kb::CVE_2013_2512.new,
          Dawn::Kb::CVE_2013_2513.new,
          Dawn::Kb::CVE_2013_2516.new,
          Dawn::Kb::CVE_2013_2615.new,
          Dawn::Kb::CVE_2013_2616.new,
          Dawn::Kb::CVE_2013_2617.new,
          Dawn::Kb::CVE_2013_3221.new,
          Dawn::Kb::CVE_2013_4164.new,
          Dawn::Kb::CVE_2013_4203.new,
          Dawn::Kb::CVE_2013_4389.new,
          Dawn::Kb::CVE_2013_4413.new,
          Dawn::Kb::CVE_2013_4457.new,
          Dawn::Kb::CVE_2013_4478.new,
          Dawn::Kb::CVE_2013_4479.new,
          Dawn::Kb::CVE_2013_4489.new,
          Dawn::Kb::CVE_2013_4491.new,
          Dawn::Kb::CVE_2013_4492.new,
          Dawn::Kb::CVE_2013_4562.new,
          Dawn::Kb::CVE_2013_4593.new,
          Dawn::Kb::CVE_2013_5647.new,
          Dawn::Kb::CVE_2013_5671.new,
          Dawn::Kb::CVE_2013_6414.new,
          Dawn::Kb::CVE_2013_6415.new,
          Dawn::Kb::CVE_2013_6416.new,
          Dawn::Kb::CVE_2013_6417.new,
          Dawn::Kb::CVE_2013_6421.new,
          Dawn::Kb::CVE_2013_6459.new,
          Dawn::Kb::CVE_2013_6460.new,
          Dawn::Kb::CVE_2013_6461.new,
          Dawn::Kb::CVE_2013_7086.new,
          Dawn::Kb::CVE_2014_0036.new,
          Dawn::Kb::CVE_2014_0080.new,
          Dawn::Kb::CVE_2014_0081.new,
          Dawn::Kb::CVE_2014_0082.new,
          Dawn::Kb::CVE_2014_0130.new,
          Dawn::Kb::CVE_2014_1233.new,
          Dawn::Kb::CVE_2014_1234.new,
          Dawn::Kb::CVE_2014_2322.new,
          Dawn::Kb::CVE_2014_2525.new,
          Dawn::Kb::CVE_2014_2538.new,
          Dawn::Kb::CVE_2014_3482.new,
          Dawn::Kb::CVE_2014_3483.new,
          Dawn::Kb::CVE_2014_3916.new,
          Dawn::Kb::CVE_2014_4975.new,
          Dawn::Kb::CVE_2014_7818.new,
          Dawn::Kb::CVE_2014_7819.new,
          Dawn::Kb::CVE_2014_7829.new,
          Dawn::Kb::CVE_2014_8090.new,
          Dawn::Kb::CVE_2014_9490.new,
          Dawn::Kb::CVE_2015_1819.new,
          Dawn::Kb::CVE_2015_1840_a.new,
          Dawn::Kb::CVE_2015_1840_b.new,
          Dawn::Kb::CVE_2015_2963.new,
          Dawn::Kb::CVE_2015_3224.new,
          Dawn::Kb::CVE_2015_3225.new,
          Dawn::Kb::CVE_2015_3226.new,
          Dawn::Kb::CVE_2015_3227.new,
          Dawn::Kb::CVE_2015_3448.new,
          Dawn::Kb::CVE_2015_4020.new,
          Dawn::Kb::CVE_2015_5312.new,
          Dawn::Kb::CVE_2015_7497.new,
          Dawn::Kb::CVE_2015_7498.new,
          Dawn::Kb::CVE_2015_7499.new,
          Dawn::Kb::CVE_2015_7500.new,
          Dawn::Kb::CVE_2015_7519.new,
          Dawn::Kb::CVE_2015_7541.new,
          Dawn::Kb::CVE_2015_7576.new,
          Dawn::Kb::CVE_2015_7577.new,
          Dawn::Kb::CVE_2015_7578.new,
          Dawn::Kb::CVE_2015_7579.new,
          Dawn::Kb::CVE_2015_7581.new,
          Dawn::Kb::CVE_2015_8241.new,
          Dawn::Kb::CVE_2015_8242.new,
          Dawn::Kb::CVE_2015_8317.new,
          Dawn::Kb::CVE_2016_0751.new,
          Dawn::Kb::CVE_2016_0752.new,
          Dawn::Kb::CVE_2016_0753.new,


          # OSVDB Checks are still here since are all about dependencies
          Dawn::Kb::OSVDB_105971.new,
          Dawn::Kb::OSVDB_108569.new,
          Dawn::Kb::OSVDB_108570.new,
          Dawn::Kb::OSVDB_108530.new,
          Dawn::Kb::OSVDB_108563.new,
          Dawn::Kb::OSVDB_115654.new,
          Dawn::Kb::OSVDB_116010.new,
          Dawn::Kb::OSVDB_117903.new,
          Dawn::Kb::OSVDB_118579.new,
          Dawn::Kb::OSVDB_118830.new,
          Dawn::Kb::OSVDB_118954.new,
          Dawn::Kb::OSVDB_119878.new,
          Dawn::Kb::OSVDB_119927.new,
          Dawn::Kb::OSVDB_120415.new,
          Dawn::Kb::OSVDB_120857.new,
          Dawn::Kb::OSVDB_121701.new,
      ]
        # END @cve_security_checks array
        # START @owasp_ror_cheatsheet_checks array
        @owasp_ror_cheatsheet_checks = [
          Dawn::Kb::OwaspRorCheatSheet::CommandInjection.new,
          Dawn::Kb::OwaspRorCheatSheet::Csrf.new,
          Dawn::Kb::OwaspRorCheatSheet::SessionStoredInDatabase.new,
          Dawn::Kb::OwaspRorCheatSheet::MassAssignmentInModel.new,
          Dawn::Kb::OwaspRorCheatSheet::SecurityRelatedHeaders.new,
          Dawn::Kb::OwaspRorCheatSheet::CheckForSafeRedirectAndForward.new,
          Dawn::Kb::OwaspRorCheatSheet::SensitiveFiles.new,
        ]
        # END @owasp_ror_cheatsheet_checks array
        @code_quality_checks = [
          Dawn::Kb::NotRevisedCode.new,
        ]
        @aux_checks =
          [
            Dawn::Kb::SimpleForm_Xss_20131129.new,
        ]

          ret = []
          ret += @aux_checks
          ret += @cve_security_checks         if @enabled_checks.include?(:cve_bulletin)
          ret += @owasp_ror_cheatsheet_checks if @enabled_checks.include?(:owasp_ror_cheatsheet)
          ret += @code_quality_checks         if @enabled_checks.include?(:code_quality)

          ret
    end

    def self.dump(verbose=false)
      puts "Security checks currently supported:"
      i=0
      self.new.all.each do |check|
        i+=1
        if verbose
          puts "Name: #{check.name}\tCVSS: #{check.cvss_score}\tReleased: #{check.release_date}"
          puts "Description\n#{check.message}"
          puts "Remediation\n#{check.remediation}\n\n"
        else
          puts "#{check.name}"
        end
      end
      puts "-----\nTotal: #{i}"

    end
  end

end
