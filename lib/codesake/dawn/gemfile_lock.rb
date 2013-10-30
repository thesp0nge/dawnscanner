module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", mvc = "")
        super(dir, "Gemfile.lock", {:force=>mvc.to_s})
      end

    end
  end
end
