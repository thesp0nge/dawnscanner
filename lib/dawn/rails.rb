require "dawn/engine"

module Dawn
  class Rails
    include Codesake::Dawn::Engine


    def initialize(dir=nil)
      super(dir, "rails")
    end

  end
end
