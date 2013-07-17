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
      attr_reader :mitigated_issues
      attr_reader :ruby_version

      attr_reader :engine_error

      attr_reader :reflected_xss

      # Typical MVC elements here

      # Each view will be something like {:filename=>"target/views/index.haml", :language=>:haml}
      attr_reader :views

      # Each controller will be a little bit more complex. Of course for
      # Sinatra, the controller filename will be the sole web application ruby
      # file.
      # {:filename=>"target/controllers/this_controller.rb", :actions=>[{:name=>"index", :method=>:get, :map=>"/"]}
      attr_reader :controllers

      # Models I don't know right now. Let them initialized as Array... we
      # will see later 
      attr_reader :models

      def initialize(dir=nil, name="")
        @name = name
        @mvc_version = ""
        @gemfile_lock = ""
        @connected_gems = []
        @checks = []
        @vulnerabilities = []
        @mitigated_issues = []
        @applied = []
        @engine_error = false

        set_target(dir) unless dir.nil?

        @views        = detect_views 
        @controllers  = detect_controllers
        @models       = detect_models
        
        load_knowledge_base
      end

      def detect_views
        []
      end
      def error!
        @error = true
      end
      def error?
        @error
      end

      def build_view_array(dir)

        return [] unless File.exist?(dir) and File.directory?(dir) 

        ret = []
        Dir.glob(File.join("#{dir}", "*")).each do |filename| 
          ret << {:filename=>filename, :language=>:haml} if File.extname(filename) == ".haml"
        end

        ret
      end

      def detect_controllers
        []
      end

      def detect_models
        []
      end

      def get_ruby_version
        # does target use rbenv?
        ver = get_rbenv_ruby_ver
        # does the target use rvm?
        ver = get_rvm_ruby_ver if ver[:version].empty? and ver[:patchlevel].empty?
        # take the running ruby otherwise
        ver = {:engine=>RUBY_ENGINE, :version=>RUBY_VERSION, :patchlevel=>"p#{RUBY_PATCHLEVEL}"} if ver[:version].empty? and ver[:patchlevel].empty? 

        ver
      end

      def set_target(dir)
        @target = dir
        @gemfile_lock = File.join(@target, "Gemfile.lock")
        @mvc_version = set_mvc_version
        @ruby_version = get_ruby_version
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
        "#{@mvc_version}" if is_good_mvc? 
      end

      ## Security stuff applies here
      #
      # Public it applies a single security check given by its name
      #
      # name - the security check to be applied
      #
      # Examples
      #   
      #   engine.apply("CVE-2013-1800") 
      #   # => boolean
      #
      # Returns a true value if the security check was successfully applied or false
      # otherwise
      def apply(name)
        load_knowledge_base if @checks.nil?
        return false if @checks.empty?

        @checks.each do |check|
          if check.name == name
            @applied << { :name=>name }
            check.ruby_version = @ruby_version[:version]
            check.detected_ruby  = @ruby_version if check.kind == Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK
            check.dependencies = self.connected_gems if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
            check.root_dir = self.target if check.kind  == Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK
            check.options = {:detected_ruby => self.ruby_version, :dependencies => self.connected_gems, :root_dir => self.target } if check.kind == Codesake::Dawn::KnowledgeBase::COMBO_CHECK

            check_vuln = check.vuln?

            @vulnerabilities  << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>nil} if check_vuln && check.kind !=  Codesake::Dawn::KnowledgeBase::COMBO_CHECK

            @vulnerabilities  << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>check.vulnerable_checks} if check_vuln && check.kind ==  Codesake::Dawn::KnowledgeBase::COMBO_CHECK

            @mitigated_issues << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>nil} if check.mitigated?
            return true
          end
        end

        false
      end

      def apply_all
        load_knowledge_base if @checks.nil?
        return false if @checks.empty?

        @checks.each do |check|
          @applied << { :name => name }

          check.ruby_version = @ruby_version[:version]
          check.detected_ruby  = @ruby_version if check.kind == Codesake::Dawn::KnowledgeBase::RUBY_VERSION_CHECK
          check.dependencies = self.connected_gems if check.kind == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
          check.root_dir = self.target if check.kind  == Codesake::Dawn::KnowledgeBase::PATTERN_MATCH_CHECK
          check.options = {:detected_ruby => self.ruby_version, :dependencies => self.connected_gems, :root_dir => self.target } if check.kind == Codesake::Dawn::KnowledgeBase::COMBO_CHECK
          check_vuln = check.vuln?

          @vulnerabilities  << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>nil} if check_vuln && check.kind !=  Codesake::Dawn::KnowledgeBase::COMBO_CHECK

          @vulnerabilities  << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>check.vulnerable_checks} if check_vuln && check.kind ==  Codesake::Dawn::KnowledgeBase::COMBO_CHECK
          @mitigated_issues << {:name=> check.name, :message=>check.message, :remediation=>check.remediation, :evidences=>check.evidences, :vulnerable_checks=>nil} if check.mitigated?
        end

        true

      end
      
      def is_applied?(name)
        @applied.each do |a|
          return true if a[:name] == name
        end
        return false
      end

      def vulnerabilities
        apply_all if @applied.empty?
        @vulnerabilities
      end

      def find_vulnerability_by_name(name)
        apply(name) unless is_applied?(name)
        @vulnerabilities.each do |v|
          return v if v[:name] == name
        end

        nil
      end

      def is_vulnerable_to?(name)
        return (find_vulnerability_by_name(name) != nil)
      end


      def has_reflected_xss?
        (@reflected_xss.count != 0)
      end

      def count_vulnerabilities
        ret = 0 
        ret = @vulnerabilities.count unless @vulnerabilities.nil?
        ret +=  @reflected_xss.count unless @reflected_xss.nil?

        ret
      end

      private
      def get_rbenv_ruby_ver
        return {:version=>"", :patchlevel=>""} unless File.exist?(File.join(@target, ".rbenv-version"))
        hash = File.read('.rbenv-version').split('-')
        return {:version=>hash[0], :patchlevel=>hash[1]}
      end
      def get_rvm_ruby_ver
        return {:version=>"", :patchlevel=>""} unless File.exist?(File.join(@target, ".ruby-version"))
        hash = File.read('.ruby-version').split('-')
        return {:version=>hash[0], :patchlevel=>hash[1]}
      end

    end
  end
end
