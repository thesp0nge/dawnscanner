require 'thor'
require 'dawn/utils'

module Dawn
  module Cli
    # This class is responsible for the "dawn kb" command and related
    # subcommands.
    class Kb < Thor
      package_name "dawnscanner"
      desc "search", "Searches the knowledge base for a given security test"
      def search(string)
        kb = Dawn::KnowledgeBase.instance
        kb.find(string)
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

      desc "scan", "scans a ruby written application for security issues"
      option :config_file
      method_option :gemfile, :type=>:boolean, :default=>true, :aliases => "-G", :desc => "uses Gemfile.lock to detect MVC"
      method_option :skip, :type=>:array, :aliases => "-S", :desc => "specify a list of security checks to be skipped"
      option :exit_on_warn, :type=>:boolean
      option :count, :type=>:boolean
      option :s
      option :output

      def scan(target)
        $logger.helo APPNAME, Dawn::VERSION
        trap("INT") { $logger.die('[INTERRUPTED]') }

        $logger.die("invalid directory (#{target})") unless Dawn::Core.is_good_target?(target)

        $debug = true if options[:debug]
        $verbose = true if options[:verbose]
        checks_to_be_skipped = []
        checks_to_be_skipped = options[:skip] unless options[:skip].nil?

        $logger.error("#{options[:skip]}")

        debug_me("scanning #{target}")

        $config_file= Dawn::Core.find_conf(true) if options[:config_file].nil?
        $config = Dawn::Core.read_conf($config_file)

        $telemetry_url = $config[:telemetry][:endpoint] if $config[:telemetry][:enabled]
        debug_me("telemetry url is " + $telemetry_url) unless @telemetry_url.nil?

        $telemetry_id = $config[:telemetry][:id] if $config[:telemetry][:enabled]
        debug_me("telemetry id is " + $telemetry_id) unless @telemetry_id.nil?

        $logger.info("telemetry is disabled in config file") unless $config[:telemetry][:enabled]

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
        if options[:output]
          STDERR.puts (ret)? engine.vulnerabilities.count : "-1" unless options[:output] == "json"
          STDERR.puts (ret)? {:status=>"OK", :vulnerabilities_count=>engine.count_vulnerabilities}.to_json : {:status=>"KO", :vulnerabilities_count=>-1}.to_json if options[:output] == "json"
          $logger.bye
          Kernel.exit(0)
        end

        Dawn::Reporter.new({:engine=>engine, :apply_all_code=>ret}).report
        $logger.bye

        Kernel.exit(0)

      end
    end
  end
end
