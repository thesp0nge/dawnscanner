require 'thor'
require 'dawn/utils'

module Dawn
  module Cli
    # This class is responsible for the "dawn kb" command and related
    # subcommands.
    class Kb < Thor
      package_name "dawnscanner"
      desc "find", "Searches the knowledge base for a given security test"
      def find(string)
        kb = Dawn::KnowledgeBase.instance
        kb.find(string)
      end

      desc "unpack", "Unpacks security checks in KB library path"
      def unpack
        $logger.helo APPNAME, Dawn::VERSION
        kb = Dawn::KnowledgeBase.instance
        kb.unpack
        $logger.bye
        Kernel.exit(0)
      end

      desc "status", "Checks the status of the knowledge base"
      def status
        $logger.helo APPNAME, Dawn::VERSION
        Dawn::KnowledgeBase.enabled_checks=[:bulletin, :generic_check]
        kb = Dawn::KnowledgeBase.instance
        kb.load
        if kb.security_checks.empty?
          $logger.error(kb.error)
        end
        $logger.info("" + kb.security_checks.count.to_s + " security checks loaded")
        if kb.is_packed?
          $logger.error "The knowledge base is packed. It must be unpacked with the 'unpack' command before it can be used"
        end
        $logger.bye
        Kernel.exit(0)
      end
    end

    class DawnCli < Thor
      package_name "dawnscanner"
      class_option :verbose, :type=>:boolean
      class_option :debug, :type=>:boolean

      map %w[--version -v] => :__print_version

      desc "--version, -v", "Prints the dawnscanner version"
      def __print_version
        puts Dawn::VERSION
        Kernel.exit(0)
      end

      desc "kb SUBCOMMAND ... ARGS", "Interacts with the knowledge base"
      subcommand "kb", Dawn::Cli::Kb

      desc "scan", "scans a ruby written web application for security issues"
      method_option :config_file,   :type=>:string,   :default=>"",     :aliases => "-c", :desc=>"tells dawn to load configuration from filename"
      method_option :gemfile,       :type=>:boolean,  :default=>true,   :aliases => "-G", :desc => "uses Gemfile.lock to detect MVC"
      method_option :skip,          :type=>:array,                      :aliases => "-S", :desc => "specify a list of security checks to be skipped"
      method_option :report_format, :type=>:string,                     :aliases => "-F", :desc=>"specify the report format (text, html, json). Default is plain text files."
      method_option :exit_on_warn,  :type=>:boolean,  :default=>false,  :aliases => "-z", :desc =>"return number of found vulnerabilities as exit code"
      method_option :count,         :type=>:boolean,  :default=>false,  :aliases => "-C", :desc=>"count vulnerabilities (useful for scripts)"
      method_option :output,        :type=>:string,                     :aliases => "-O", :desc=>"write output to a file with the name specified by the parameter"
      method_option :dependencies,  :type=>:boolean,  :default=>false,  :aliases => "-d", :desc=>"scan only for vulnerabilities affecting dependencies in Gemfile.lock"

      def scan(target)
        $logger.helo APPNAME, Dawn::VERSION
        trap("INT") { $logger.die('[INTERRUPTED]') }

        $logger.die("invalid directory (#{target})") unless Dawn::Core.is_good_target?(target)

        $debug = true if options[:debug]
        $verbose = true if options[:verbose]
        checks_to_be_skipped = []
        checks_to_be_skipped = options[:skip] unless options[:skip].nil?

        debug_me("scanning #{target}")

        $config_file= Dawn::Core.find_conf(true) if options[:config_file].nil?
        $config = Dawn::Core.read_conf($config_file)

        debug_me($config)

        $telemetry_url = $config[:telemetry][:endpoint] if $config[:telemetry][:enabled]
        debug_me("telemetry url is " + $telemetry_url) unless @telemetry_url.nil?

        $telemetry_id = $config[:telemetry][:id] if $config[:telemetry][:enabled]
        debug_me("telemetry id is " + $telemetry_id) unless @telemetry_id.nil?

        debug_me("telemetry is disabled in config file") unless $config[:telemetry][:enabled]

        engine = Dawn::Core.detect_mvc(target) unless options[:gemfile]
        engine = Dawn::GemfileLock.new(target) if options[:gemfile]

        if engine.nil?
          $logger.error("MVC detection failure. Please open an issue at https://github.com/thesp0nge/dawnscanner/issues")
          $logger.die('ruby framework auto detect failed.')
        end

        if options[:exit_on_warn]
          Kernel.at_exit do
            if engine.count_vulnerabilities != 0
              Kernel.exit(engine.count_vulnerabilities)
            end
          end
        end


        engine.load_knowledge_base

        ret = engine.apply_all(checks_to_be_skipped)


        if options[:report_format] and options[:report_format].eql? "json"
          STDERR.puts (ret)? {:status=>"OK", :vulnerabilities_count=>engine.count_vulnerabilities}.to_json : {:status=>"KO", :vulnerabilities_count=>-1}.to_json
          $logger.bye
          Kernel.exit(0)
        end

        $logger.info("#{engine.count_vulnerabilities} issues found")

        Dawn::Reporter.new({:engine=>engine, :apply_all_code=>ret}).report
        $logger.bye

        Kernel.exit(0)

      end
    end
  end
end
