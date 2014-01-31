module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", filename = "", debug, guessed_mvc)
        debug_me "GUESSED MVS IS #{guessed_mvc}"
        super(dir, "Gemfile.lock", {:gemfile_name=>filename, :debug=>debug, :guessed_mvc=>guessed_mvc})
      end

    end
  end
end
