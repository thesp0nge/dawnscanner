module Codesake
  module Dawn
    class Core

      
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
