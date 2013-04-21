require "codesake/dawn/engine"

module Codesake
  module Dawn
    class Sinatra
      include Codesake::Dawn::Engine

      def initialize(dir=nil)
        super(dir, "sinatra")
      end

    end
  end
end
