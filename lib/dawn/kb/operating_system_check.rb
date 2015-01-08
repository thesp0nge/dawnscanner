  module Dawn
    module Kb
      module OperatingSystemCheck
        include BasicCheck

        # safe_os is an Hash with this form {:family=>"", :vendor=>"", :version=>""}
        #
        # family can be one of the following:
        #   "linux"
        #   "windows"
        #   "unix"
        #   "osx"
        #   "freebsd"
        #   "netbsd"
        #   "openbsd"
        #   "unknown"
        # vendor will be either "microsoft", "apple", unix flavour or linux distribution accordingly
        attr_accessor :safe_os
        attr_accessor :target_os


        def initialize(options={})
          super(options)
          os_detect
        end

        def vuln?
          
          return false if different_family? 
          return false if different_vendor?
          return vulnerable_os?
        end

        def different_family?
          ret = false
          @safe_os.each do |sos|
            ret = true if ! ret && sos[:family] == @target_os[:family]
          end
          ret
        end

        def different_vendor?
          ret = false
          @safe_os.each do |sos|
            ret = true if ! ret && sos[:vendor] == @target_os[:vendor]
          end
          ret
        end

        def vulnerable_os?
          ret = false
          @safe_os.each do |sos|
            ret = true if ! ret && sos[:version] = 'none'
            ret = true if ! ret && is_vulnerable_version?(@target_os[:family], sos[:version])
          end
          ret
        end

        
        def os_detect
          platform = RUBY_PLATFORM

          @target_os = {}

          @target_os[:family] = "osx"; @target_os[:vendor]="apple" unless /darwin/.match(platform).nil?
          @target_os[:family] = "windows"; @target_os[:vendor]="microsoft" unless /win32/.match(platform).nil?
          @target_os[:family] = "linux" unless /linux/.match(platform).nil?
          @target_os[:family] = "unix"; @target_os[:vendor]="freebsd" unless /freebsd/.match(platform).nil?
          @target_os[:family] = "unix"; @target_os[:vendor]="openbsd" unless /openbsd/.match(platform).nil?
          @target_os[:family] = "unix"; @target_os[:vendor]="netbsd" unless /netbsd/.match(platform).nil?

          begin 
            require 'sys/uname'
            @target_os[:version]= [Sys::Uname.release]
          rescue # otherwise use shell
            @target_os[:version] = [`uname -r`.strip]
          end

          tmp = ""
          if File.exist?("/etc/SuSE-release")
            tmp = File.readlines("/etc/SuSE-release"); 
            @target_os[:vendor]="suse" 
          end

          if File.exist?("/etc/redhat_release")
            tmp = File.readlines("/etc/redhat_release"); 
            @target_os[:vendor]="redhat" 
          end
          if File.exist?("/etc/debian_release")
            tmp = File.readlines("/etc/debian_release");
            @target_os[:vendor]="debian" 
          end
        end
      end
    end
  end
