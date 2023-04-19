module Cvss
  module Helpers
    def data_integrity
      @base[:i]
    end
    def data_confidentiality
      @base[:c]
    end
    def data_availability
      @base[:a]
    end
  end
end
