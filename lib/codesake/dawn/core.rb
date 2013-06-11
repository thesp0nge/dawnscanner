module Codesake
  module Dawn
    class Core
      def self.detect_mvc(target)
        gemfile_lock =  File.join(target, "Gemfile.lock")
        lockfile = Bundler::LockfileParser.new(Bundler.read_file(gemfile_lock))
        lockfile.specs.each do |s|
          return Codesake::Dawn::Rails.new    if s.name == "rails"
          # return Codesake::Dawn::Padrino.new  if s.name == "padrino"
        end

        return Codesake::Dawn::Sinatra.new 
      end
    end
  end
end
