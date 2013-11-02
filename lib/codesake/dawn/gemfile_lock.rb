module Codesake
  module Dawn
    class GemfileLock
      include Codesake::Dawn::Engine

      def initialize(dir = "./", mvc = "", filename = "")
        super(dir, "Gemfile.lock", {:force=>mvc.to_s, :gemfile_name=>filename})
      end

    end
  end
end
