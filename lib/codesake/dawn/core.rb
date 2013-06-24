module Codesake
  module Dawn
    class Core
      def self.detect_mvc(target)
        my_dir = Dir.pwd
        Dir.chdir(target) 
        raise ArgumentError.new("no Gemfile.lock in #{target}") unless File.exist?("Gemfile.lock")

        lockfile = Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock"))
        Dir.chdir(my_dir)
        lockfile.specs.each do |s|
          return Codesake::Dawn::Rails.new(target)    if s.name == "rails"
          # return Codesake::Dawn::Padrino.new  if s.name == "padrino"
        end

        return Codesake::Dawn::Sinatra.new(target) 
      end

      def self.is_good_target?(target)
        (File.exist?(target) and File.directory?(target))
      end
    end
  end
end
