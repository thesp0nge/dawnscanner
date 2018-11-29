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
      map %w[--version -v] => :__print_version

      desc "--version, -v", "Prints the dawnscanner version"
      def __print_version
        puts Dawn::VERSION
        Kernel.exit(0)
      end

      desc "kb SUBCOMMAND ... ARGS", "Interacts with the knowledge base"
      subcommand "kb", Dawn::Cli::Kb

    end
  end
end
