require "dawn/engine"

module Dawn
  class Rails
    include Engine


    def initialize(dir=nil)
      super(dir, "rails")
    end

  end
end
