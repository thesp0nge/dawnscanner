module Codesake
  module Dawn
    class Core

      def self.help
        puts "Usage: dawn [options] target_directory"
        printf "\n\nExamples:"
        puts "$ dawn a_sinatra_webapp_directory"
        puts "$ dawn -C the_rails_blog_engine"
        puts "$ dawn -C --output json a_sinatra_webapp_directory"
        printf "\n   -r, --rails\t\t\t\t\tforce dawn to consider the target a rails application" 
        printf "\n   -s, --sinatra\t\t\t\tforce dawn to consider the target a sinatra application" 
        printf "\n   -p, --padrino\t\t\t\tforce dawn to consider the target a padrino application" 
        printf "\n   -G, --gem-lock\t\t\t\tforce dawn to scan only for vulnerabilities affecting dependencies in Gemfile.lock"
        printf "\n   -D, --debug\t\t\t\t\tenters dawn debug mode"
        printf "\n   -f, --list-known-framework\t\t\tlist ruby MVC frameworks supported by dawn"
        printf "\n   -k, --list-knowledgebase [check_name]\tlist dawn known security checks. If check_name is specified dawn says if check is present or not"
        printf "\n   -o, --output [console, json. csv, html]\tthe output will be in the specified format"
        printf "\n   -V, --verbose\t\t\t\tthe output will be more verbose"
        printf "\n   -C, --count-only\t\t\t\tdawn will only count vulnerabilities (useful for scripts)"
        printf "\n   -z, --exit-on-warn\t\t\t\tdawn will return number of found vulnerabilities as exit code"
        printf "\n   -v, --version\t\t\t\tshow version information"
        printf "\n   -h, --help\t\t\t\t\tshow this help\n"

        0
      end


      def self.output_json_run(target = "", engine = nil)
        result = {}
        return {:status=>"KO", :message=>"BUG at #{__FILE__}@#{__LINE__}: target is empty or engine is nil."}.to_json if target.empty? or engine.nil?
        return {:status=>"KO", :message=>"#{target} doesn't exist"}.to_json if ! Dir.exist?(target)
        check_applied = Codesake::Dawn::Core.dry_run(target, engine)
        return {:status=>"KO", :message=>"no security checks applied"}.to_json unless check_applied

        result[:status]="OK"
        result[:target]=target
        result[:mvc]=engine.name
        result[:mvc_version]=engine.get_mvc_version
        result[:vulnerabilities_count]=engine.count_vulnerabilities
        result[:vulnerabilities]=[]
        engine.vulnerabilities.each do |v|
          result[:vulnerabilities] << v[:name]
        end
        result[:mitigated_vuln_count]=engine.mitigated_issues.count
        result[:mitigated_vuln] = engine.mitigated_issues
        result[:reflected_xss] = []
        engine.reflected_xss.each do |r|
          result[:reflected_xss] << "request parameter \"#{r[:sink_source]}\""
        end

        result.to_json
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


      def self.dry_run(target, engine)
        engine.set_target(target) 
        engine.load_knowledge_base
        engine.apply_all
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
    end
  end
end
