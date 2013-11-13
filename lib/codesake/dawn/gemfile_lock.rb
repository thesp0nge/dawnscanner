module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", mvc = "", filename = "", debug, guessed_mvc )
        super(dir, "Gemfile.lock", {:force=>mvc.to_s, :gemfile_name=>filename, :debug=>debug, :guessed_mvc=>guessed_mvc})
      end

    end
  end
end
