# Statistics stuff
# require 'code_metrics/statistics'

module Dawn
  module Engine
    include Dawn::Utils

    attr_reader :target
    attr_reader :name
    attr_reader :scan_start
    attr_reader :scan_stop
    # This attribute is used when @name == "Gemfile.lock" to force the
    # loading of specific MVC checks
    attr_reader :force
    attr_reader :gemfile_lock
    attr_reader :mvc_version
    attr_reader :connected_gems
    attr_reader :checks
    attr_reader :vulnerabilities
    attr_reader :mitigated_issues
    attr_reader :ruby_version

    attr_reader :engine_error
    attr_reader :stats

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

    attr_accessor :debug

    attr_reader   :applied_checks
    attr_reader   :skipped_checks

    attr_reader   :output_dir_name

    def initialize(dir=nil, name="", options={})
      @name = name
      @scan_start = Time.now
      @scan_stop = @scan_start
      @mvc_version = ""
      @gemfile_lock = ""
      @force = ""
      @connected_gems = []
      @checks = []
      @vulnerabilities = []
      @mitigated_issues = []
      @applied = []
      @reflected_xss = []
      @engine_error = false
      @debug = false
      @debug = options[:debug] unless options[:debug].nil?
      @applied_checks = 0
      @skipped_checks = 0
      @gemfile_lock_sudo = false

      set_target(dir) unless dir.nil?
      @ruby_version = get_ruby_version if dir.nil?
      @gemfile_lock = options[:gemfile_name] unless options[:gemfile_name].nil? 

      # @stats        = gather_statistics

      @views        = detect_views
      @controllers  = detect_controllers
      @models       = detect_models

      @output_dir_name = output_dir

      if $logger.nil?
        require 'logger'
        $logger = Logger.new(STDOUT)
        $logger.helo "dawn-engine", Dawn::VERSION

      end
      $logger.warn "pattern matching security checks are disabled for Gemfile.lock scan" if @name == "Gemfile.lock"
      $logger.warn "combo security checks are disabled for Gemfile.lock scan" if @name == "Gemfile.lock"
      debug_me "engine is in debug mode" 

      if @name == "Gemfile.lock" && ! options[:guessed_mvc].nil?
        # since all checks relies on @name a Gemfile.lock engine must
        # impersonificate the engine for the mvc it was detected
        debug_me "now I'm switching my name from #{@name} to #{options[:guessed_mvc][:name]}" 
        $logger.err "there are no connected gems... it seems Gemfile.lock parsing failed" if options[:guessed_mvc][:connected_gems].empty?
        @name = options[:guessed_mvc][:name]
        @mvc_version = options[:guessed_mvc][:version]
        @connected_gems = options[:guessed_mvc][:connected_gems]
        @gemfile_lock_sudo = true
      end

      # FIXME.20140325
      #
      # I comment out this call. knowledge base must be called explicitly
      # since it's now possible to pass an array saying check families to be
      # loaded.
      #
      # load_knowledge_base
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
      unless @target.nil?

        # does target use rbenv?
        ver = get_rbenv_ruby_ver
        # does the target use rvm?
        ver = get_rvm_ruby_ver if  ver[:version].empty? && ver[:patchlevel].empty?
        # take the running ruby otherwise
        ver = {:engine=>RUBY_ENGINE, :version=>RUBY_VERSION, :patchlevel=>"p#{RUBY_PATCHLEVEL}"} if ver[:version].empty? && ver[:patchlevel].empty? 
      else
        ver = {:engine=>RUBY_ENGINE, :version=>RUBY_VERSION, :patchlevel=>"p#{RUBY_PATCHLEVEL}"} 

      end

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

    def load_knowledge_base(enabled_checks=[])
      debug_me("load_knowledge_base called. Enabled checks are: #{enabled_checks}")
      if @name == "Gemfile.lock"
        @checks = Dawn::KnowledgeBase.new({:enabled_checks=>enabled_checks}).all if @force.empty?
        @checks = Dawn::KnowledgeBase.new({:enabled_checks=>enabled_checks}).all_by_mvc(@force) unless @force.empty? 
      else
        @checks = Dawn::KnowledgeBase.new({:enabled_checks=>enabled_checks}).all_by_mvc(@name) 

      end
      debug_me("#{@checks.count} checks loaded")
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
        # detecting MVC version using @name in case of sinatra, padrino or rails engine
        ver= s.version.to_s if s.name == @name && @name != "Gemfile.lock" 
        # detecting MVC version using @force in case of Gemfile.lock engine
        ver= s.version.to_s if s.name == @force.to_s && @name == "Gemfile.lock" 
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
      target_is_dir? && is_good_mvc?
    end

    def get_mvc_version
      "#{@mvc_version}" if is_good_mvc?
    end

    ########################################################################
    ## Output stuff - START
    ########################################################################

    # Creates the directory name where dawnscanner results will be saved
    #
    # Examples
    #   engine.create_output_dir
    #   # => /Users/thesp0nge/dawnscanner/results/railsgoat/20151123
    #   # => /Users/thesp0nge/dawnscanner/results/railsgoat/20151123_1 (if
    #               previous directory name exists)
    def output_dir
      @output_dir_name = File.join(Dir.home, 'dawnscanner', 'results', File.basename(@target), Time.now.strftime('%Y%m%d'))
      if Dir.exist?(@output_dir_name)
        i=1
        while (Dir.exist?(@output_dir_name)) do
          @output_dir_name = File.join(Dir.home, 'dawnscanner', 'results', File.basename(@target), "#{Time.now.strftime('%Y%m%d')}_#{i}")
          i+=1
        end
      end
      @output_dir_name
    end

    # Creates the directory
    def create_output_dir
      FileUtils.mkdir_p(@output_dir_name)
      @output_dir_name
    end

    ########################################################################
    ## Output stuff - END
    ########################################################################



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

      # FIXME.20140325
      # Now if no checks are loaded because knowledge base was not previously called, apply and apply_all proudly refuse to run.
      # Reason is simple, load_knowledge_base now needs enabled check array
      # and I don't want to pollute engine API to propagate this value. It's
      # a param to load_knowledge_base and then bin/dawn calls it
      # accordingly.
      # load_knowledge_base if @checks.nil?
      if @checks.nil?
        $logger.err "you must load knowledge base before trying to apply security checks"
        return false
      end

      return false if @checks.empty?

      @checks.each do |check|
        _do_apply(check) if check.name == name
      end

      false
    end

    def apply_all
      @scan_start = Time.now
      debug_me("SCAN STARTED: #{@scan_start}")

      # FIXME.20140325
      # Now if no checks are loaded because knowledge base was not previously called, apply and apply_all proudly refuse to run.
      # Reason is simple, load_knowledge_base now needs enabled check array
      # and I don't want to pollute engine API to propagate this value. It's
      # a param to load_knowledge_base and then bin/dawn calls it
      # accordingly.
      # load_knowledge_base if @checks.nil?
      if @checks.nil?
        $logger.err "you must load knowledge base before trying to apply security checks"
        @scan_stop = Time.now
        debug_me("SCAN STOPPED: #{@scan_stop}")
        return false
      end
      if @checks.empty?
        @scan_stop = Time.now
        debug_me("SCAN STOPPED: #{@scan_stop}")
        return false
      end

      @checks.each do |check|
        _do_apply(check)
      end

      @scan_stop = Time.now
      debug_me("SCAN STOPPED: #{@scan_stop}")

      true

    end

    def scan_time
      @scan_stop - @scan_start
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
      (@reflected_xss.count != 0) unless @reflected_xss.nil?
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
      hash = File.read(File.join(@target, '.rbenv-version')).split('-')
      return {:version=>hash[0], :patchlevel=>hash[1]}
    end
    def get_rvm_ruby_ver
      return {:version=>"", :patchlevel=>""} unless File.exist?(File.join(@target, ".ruby-version"))
      hash = File.read(File.join(@target, '.ruby-version')).split('-')
      return {:version=>hash[0], :patchlevel=>hash[1]}
    end
    def _do_apply(check)
      unless ((check.kind == Dawn::KnowledgeBase::PATTERN_MATCH_CHECK || check.kind == Dawn::KnowledgeBase::COMBO_CHECK ) && @gemfile_lock_sudo)

        @applied << { :name => name }
        debug_me "applying check #{check.name}"
        @applied_checks += 1

        check.ruby_version  = @ruby_version[:version]
        check.detected_ruby = @ruby_version                           if check.kind == Dawn::KnowledgeBase::RUBY_VERSION_CHECK
        check.dependencies  = self.connected_gems                     if check.kind == Dawn::KnowledgeBase::DEPENDENCY_CHECK
        check.root_dir      = self.target                             if check.kind == Dawn::KnowledgeBase::PATTERN_MATCH_CHECK
        check.options       = {:detected_ruby => self.ruby_version,
                               :dependencies => self.connected_gems,
                               :root_dir => self.target }             if check.kind == Dawn::KnowledgeBase::COMBO_CHECK
        check_vuln          = check.vuln?

        if check_vuln

          vc = nil
          vc = check.vulnerable_checks if check.kind == Dawn::KnowledgeBase::COMBO_CHECK

          @vulnerabilities  << {:name=> check.name,
                                :severity=>check.severity,
                                :priority=>check.priority,
                                :kind=>check.check_family,
                                :message=>check.message,
                                :remediation=>check.remediation,
                                :evidences=>check.evidences,
                                :cve_link=>check.cve_link,
                                :cvss_score=>check.cvss_score,
                                :vulnerable_checks=>vc}

        end

        @mitigated_issues << {:name=> check.name,
                              :severity=>check.severity,
                              :priority=>check.priority,
                              :kind=>check.check_family,
                              :message=>check.message,
                              :remediation=>check.remediation,
                              :evidences=>check.evidences,
                              :vulnerable_checks=>nil} if check.mitigated?
      else
        debug_me "skipping check #{check.name}"
        @skipped_checks += 1
      end

      true
    end

    # def gather_statistics
      # dirs = CodeMetrics::StatsDirectories.new
      # puts target
      # dirs.add_directories("#{target}/**/*.rb", "#{target}")
      # puts CodeMetrics::Statistics.new(*dirs).to_s
    # end
  end
end
