# This module handles security checks for RubyGems framework.
module Dawn
  module Kb
    module GemCheck
      include BasicCheck

      attr_accessor :safe_versions
      attr_accessor :my_gem_version

      def initialize(options)
        super(options)
        @safe_versions  ||= options[:safe_versions]
        @my_gem_version ||= options[:my_gem_version]

        @my_gem_version = take_gem_version_from_system if @my_gem_version.nil?
      end

      def take_gem_version_from_system
        require 'rubygems'
        return Gem::VERSION
      end

      def vuln?
        debug_me "here"
        @safe_versions.each do |sv|
          v = Dawn::Kb::VersionCheck.new(
            {
              :safe=>sv[:version],
              :detected=>@my_gem_version,
              :save_minor => true,
              :save_major => false,
            }
          )
          v.debug = self.debug
          return true if v.vuln?
        end

        return false
      end

    end
  end
end
