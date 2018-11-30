require 'thor'

module Dawn
  module Cli
    
    # This class is responsible for the "dawn kb" command and related
    # subcommands.
    class Kb < Thor
      desc "search", "Searches the knowledge base for a given security test"
      def search(string)
        kb = Dawn::KnowledgeBaseExperimental.instance
        kb.find(string)
      end

      desc "status", "Checks the status of the knowledge base"
      def status
        $logger.helo APPNAME, Dawn::VERSION
        Dawn::KnowledgeBaseExperimental.path="/home/thesp0nge/src/hacking/dawnscanner/db"
        Dawn::KnowledgeBaseExperimental.enabled_checks=[:bulletin, :generic_check]
        kb = Dawn::KnowledgeBaseExperimental.instance
        kb.load
        if kb.is_packed?
          $logger.error "The knowledge base is packed. It must be unpacked with the 'unpack' command before it can be used" 
        else
          if kb.is_valid?
            $logger.info "Good Knowledge base found"
          else
            $logger.error "Invalid knowledge base found"
          end
        end
        $logger.bye
        Kernel.exit(0)
      end
    end

    class DawnCli < Thor
      class_option :verbose, :type=>:boolean

      map %w[--version -v] => :__print_version

      desc "--version, -v", "Prints the dawnscanner version"
      def __print_version
        puts Dawn::VERSION
        Kernel.exit(0)
      end

      desc "kb SUBCOMMAND ... ARGS", "Interacts with the knowledge base"
      subcommand "kb", Dawn::Cli::Kb

      desc "scan", "scans a folder for security issues"
      option :gemfile, :type=>:boolean
      option :exit_on_warn, :type=>:boolean
      option :debug, :type=>:boolean
      option :verbose, :type=>:boolean
      option :count, :type=>:boolean
      option :output

      def scan(target)
        $logger.helo APPNAME, Dawn::VERSION
        $logger.debug "scanning #{target}"
        trap("INT") { $logger.die('[INTERRUPTED]') }

        $logger.die("invalid directory (#{target})") unless Dawn::Core.is_good_target?(target)

        $debug = true if options[:debug]
        $verbose = true if options[:verbose]

        
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
        ret = engine.apply_all
        if options[:output]
          STDERR.puts (ret)? engine.vulnerabilities.count : "-1" unless options[:output] == "json"
          STDERR.puts (ret)? {:status=>"OK", :vulnerabilities_count=>engine.count_vulnerabilities}.to_json : {:status=>"KO", :vulnerabilities_count=>-1}.to_json if options[:output] == "json"

          # r.do_save({:target=>engine.target, :scan_started=>engine.scan_start, :scan_duration => engine.scan_time.round(3), :issues_found=>engine.vulnerabilities.count, :output_dir=>engine.output_dir_name, :scan_status=>:completed})
          $logger.bye
          Kernel.exit(0)
        end

        Dawn::Reporter.new({:engine=>engine, :apply_all_code=>ret}).report

        Kernel.exit(0)

      end
    end
  end
end
