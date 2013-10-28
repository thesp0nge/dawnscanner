module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize
        super("./", "Gemfile.lock")

      end

    end
  end
end
