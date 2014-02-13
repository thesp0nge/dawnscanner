module Codesake
  module Dawn
    module Kb
      class VersionCheck
        include BasicCheck

        attr_accessor :safe
        attr_accessor :deprecate
        attr_accessor :exclude
        attr_accessor :detected


        def initialize(options={})
          super(options)
          debug_me "VersionCheck initialized"
        end

        def vuln?
        end

      end
    end
  end
end
