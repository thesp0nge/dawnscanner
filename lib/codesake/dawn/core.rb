require "yaml"

module Codesake
  module Dawn
    class Core

      # TODO.20140326
      # All those methods must moved from here to Util class and a
      # Codesake::Dawn::Core namespace must be created.
      def self.help
        puts "Usage: dawn [options] target_directory"
        printf "\nExamples:\n"
        puts "\t$ dawn a_sinatra_webapp_directory"
        puts "\t$ dawn -C the_rails_blog_engine"
        puts "\t$ dawn -C --json a_sinatra_webapp_directory"
        puts "\t$ dawn --ascii-tabular-report my_rails_blog_ecommerce"
        puts "\t$ dawn --html -F my_report.html my_rails_blog_ecommerce"
        printf "\n   -r, --rails\t\t\t\t\tforce dawn to consider the target a rails application"
        printf "\n   -s, --sinatra\t\t\t\tforce dawn to consider the target a sinatra application"
        printf "\n   -p, --padrino\t\t\t\tforce dawn to consider the target a padrino application"
        printf "\n   -G, --gem-lock\t\t\t\tforce dawn to scan only for vulnerabilities affecting dependencies in Gemfile.lock"
        printf "\n   -a, --ascii-tabular-report\t\t\tcause dawn to format findings using table in ascii art"
        printf "\n   -j, --json\t\t\t\t\tcause dawn to format findings using json"
        printf "\n   -C, --count-only\t\t\t\tdawn will only count vulnerabilities (useful for scripts)"
        printf "\n   -z, --exit-on-warn\t\t\t\tdawn will return number of found vulnerabilities as exit code"
        printf "\n   -F, --file filename\t\t\t\ttells dawn to write output to filename"
        printf "\n   -c, --config-file filename\t\t\ttells dawn to load configuration from filename"
        printf "\n\nDisable security check family\n"
        printf "\n       --disable-cve-bulletins\t\t\tdisable all CVE security checks"
        printf "\n       --disable-code-quality\t\t\tdisable all code quality checks"
        printf "\n       --disable-code-style\t\t\tdisable all code style checks"
        printf "\n       --disable-owasp-ror-cheatsheet\t\tdisable all Owasp Ruby on Rails cheatsheet checks"
        printf "\n       --disable-owasp-top-10\t\t\tdisable all Owasp Top 10 checks"
        printf "\n\nFlags useful to query Codesake::Dawn\n"
        printf "\n   -S, --search-knowledge-base [check_name]\tsearch check_name in the knowledge base"
        printf "\n       --list-knowledge-base\t\t\tlist knowledge-base content"
        printf "\n       --list-known-families\t\t\tlist security check families contained in dawn's knowledge base"
        printf "\n       --list-known-framework\t\t\tlist ruby MVC frameworks supported by dawn"
        printf "\n\nService flags\n"
        printf "\n   -D, --debug\t\t\t\t\tenters dawn debug mode"
        printf "\n   -V, --verbose\t\t\t\tthe output will be more verbose"
        printf "\n   -v, --version\t\t\t\tshow version information"
        printf "\n   -h, --help\t\t\t\t\tshow this help\n"

        true
      end

      def self.dump_knowledge_base(verbose = false)
        kb = Codesake::Dawn::KnowledgeBase.new
        lines = []
        lines << "Security checks currently supported:\n"

        kb.all.each do |check|
          if verbose
            lines << "Name: #{check.name}\tCVSS: #{check.cvss_score}\tReleased: #{check.release_date}"
            lines << "Description\n#{check.message}"
            lines << "Remediation\n#{check.remediation}\n\n"
          else
            lines << "#{check.name}"
          end
        end
        lines << "-----\nTotal: #{kb.all.count}"

        lines.empty? ? 0 : lines.compact.join("\n")

      end

      # guess_mvc is very close to detect_mvc despite it accepts a
      # filename as input and it tries to guess the mvc framework used from the
      # gems it founds in Gemfile.lock without creating an engine.

      def self.guess_mvc(gemfile_lock)
        ret = {:name=>"", :version=>"", :connected_gems=>[]}

        a = []
        my_dir = Dir.pwd
        Dir.chdir(File.dirname(gemfile_lock))
        raise ArgumentError.new("can't read #{gemfile_lock}") unless File.readable?(File.basename(gemfile_lock))

        lockfile = Bundler::LockfileParser.new(Bundler.read_file(File.basename(gemfile_lock)))
        Dir.chdir(my_dir)
        lockfile.specs.each do |s|
          ret = {:name=>s.name, :version=>s.version.to_s} if s.name == "rails" || s.name == "sinatra"
          a << {:name=>s.name, :version=>s.version.to_s}
        end

        ret[:connected_gems]=a
        ret

      end

      def self.detect_mvc(target)

        raise ArgumentError.new("you must set target directory") if target.nil?

        my_dir = Dir.pwd
        Dir.chdir(target)
        raise ArgumentError.new("no Gemfile.lock in #{target}") unless File.exist?("Gemfile.lock")

        lockfile = Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock"))
        Dir.chdir(my_dir)
        lockfile.specs.each do |s|
          return Codesake::Dawn::Rails.new(target)    if s.name == "rails"
          return Codesake::Dawn::Padrino.new(target)  if s.name == "padrino"
        end

        return Codesake::Dawn::Sinatra.new(target)
      end

      def self.is_good_target?(target)
        (File.exist?(target) and File.directory?(target))
      end

      def self.find_conf(create_if_none = false)
        conf_name  = 'codesake-dawn.yaml'
        path_order = [
          './',
          '~/',
          '/usr/local/etc/',
        ]
        path_order.each do |p|
          fn = p + conf_name if p.start_with?('/')
          # if outside $HOME the config file must be hidden
          fn = File.expand_path(p) + '/.'+conf_name if ! p.start_with?('/')
          return fn if File.exist?(fn)
        end

        # Codesake::Dawn didn't find a config file.
        # If create_if_none flag is set to false, than I'll return nil so the
        # read_conf method will return the default configuration
        return nil unless create_if_none

        # If create_if_none flag is set to true, than I'll create a config file
        # on the current directory with the default configuration.
        conf = {"config"=>{:verbose=>false, :output=>"console", :mvc=>"", :gemfile_scan=>false, :gemfile_name=>"", :filename=>nil, :debug=>false, :exit_on_warn => false, :enabled_checks=> Codesake::Dawn::Kb::BasicCheck::ALLOWED_FAMILIES}}

        File.open(File.expand_path('~') +'/.'+conf_name, 'w') do |f|
          f.write(YAML.dump(conf))
        end
      end

      def self.read_conf(file=nil)
        conf = {:verbose=>false, :output=>"console", :mvc=>"", :gemfile_scan=>false, :gemfile_name=>"", :filename=>nil, :debug=>false, :exit_on_warn => false, :enabled_checks=> Codesake::Dawn::Kb::BasicCheck::ALLOWED_FAMILIES}
        file = file.chop if file.end_with? '/'
        begin
          return conf if file.nil?
          return conf if ! File.exist?(file)
        rescue => e
          $logger.err "it seems you've found a bug in core.rb@#{__LINE__}: #{e.message}"
          return conf
        end

        c = YAML.load_file(file)

        cf = c["config"]
        cc = cf[:enabled_checks]

        # TODO
        # I must add some sanity check here
        conf[:verbose] = cf["verbose"] unless cf["verbose"].nil?
        conf[:debug] = cf["debug"] unless cf["debug"].nil?
        conf[:output] = cf["output"] unless cf["output"].nil?
        conf[:enabled_checks] = cc unless cc.nil?

        return conf
      end
    end
  end
end
