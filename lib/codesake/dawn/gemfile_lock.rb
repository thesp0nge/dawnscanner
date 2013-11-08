module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", mvc = "", filename = "", debug)
        super(dir, "Gemfile.lock", {:force=>mvc.to_s, :gemfile_name=>filename, :debug=>debug})
      end

    end
  end
end
