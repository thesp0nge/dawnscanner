module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", filename = "", guessed_mvc)
        super(dir, "Gemfile.lock", {:gemfile_name=>filename, :guessed_mvc=>guessed_mvc})
      end

    end
  end
end
