require "codesake/dawn/engine"

module Codesake
  module Dawn
    class Sinatra
      include Codesake::Dawn::Engine

      def initialize(dir=nil)
        super(dir)
        @name = "sinatra"
      end

    end
  end
end
