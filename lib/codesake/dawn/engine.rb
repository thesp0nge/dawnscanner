require 'bundler'

module Codesake
  module Dawn
    module Engine
      attr_reader :target
      attr_reader :name
      attr_reader :gemfile_lock
      attr_reader :mvc_version
      attr_reader :connected_gems
      attr_reader :checks
      attr_reader :vulnerabilities

      def initialize(dir=nil, name="")
        @name = name
        @mvc_version = ""
        @gemfile_lock = ""
        @connected_gems = []
        @checks = []
        @vulnerabilities= []
        set_target(dir) unless dir.nil?
        load_knowledge_base
      end

      def set_target(dir)
        @target = dir
        @gemfile_lock = File.join(@target, "Gemfile.lock")
        @mvc_version = set_mvc_version
      end

      def target_is_dir?
        File.directory?(@target)
      end

      def load_knowledge_base
        @checks = Codesake::Dawn::KnowledgeBase.new.all_by_mvc(self.name)
        @checks
      end

      def set_mvc_version
        ver = ""
        return ver unless target_is_dir?
        return ver unless has_gemfile_lock?

        my_dir = Dir.pwd
        Dir.chdir(@target) 
        lockfile = Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock"))
        lockfile.specs.each do |s|
          ver= s.version.to_s if s.name == @name
          @connected_gems << {:name=>s.name, :version=>s.version.to_s}
        end
        Dir.chdir(my_dir)
        return ver
      end

      def has_gemfile_lock?
        File.exist?(@gemfile_lock)
      end

      def is_good_mvc?
        (@mvc_version != "")
      end

      def can_apply?
        target_is_dir? and is_good_mvc?
      end

      def get_mvc_version
        "#{@name} #{@mvc_version}" if is_good_mvc? 
      end

      ## Security stuff applies here
      #
      # Public it applies a single security check given by its name
      #
      # name - the security check to be applied
      #
      # Examples
      #   
      #   engine.applies("CVE-2013-1800") 
      #   # => boolean
      #
      # Returns a true value if the security check was successfully applied or false
      # otherwise
      def apply(name)
        load_knowledge_base if @checks.nil?

        @checks.each do |check|
          if check.name == name
            check.dependencies = self.connected_gems if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
            @vulnerabilities << {:name=> name } if check.vuln?
            return true
          end
        end

        false
      end

      def apply_all
        load_knowledge_base if @checks.nil?
        return false if @checks.empty?

        @checks.each do |check|
          check.dependencies = self.connected_gems if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
          @vulnerabilities << {:name=> name } if check.vuln?
        end

        true

      end
      

      def is_vulnerable_to?(name)
        @vulnerabilities.each do |v|
          return true if v[:name] == name
        end

        false
      end
    end
  end
end
