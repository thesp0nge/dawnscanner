module Codesake
  module Dawn
    module Kb
      module DeprecationCheck
        include BasicCheck

        DEPRECATION_MATRIX = [
          {:gem=>"rails", :versions=>['0.x', '1.x', '2.x']},
          {:gem=>"sinatra", :versions=>['0.x', '1.x', '2.x']},
          {:gem=>"padrino", :versions=>['0.x', '1.x', '2.x']},
          {:gem=>"ruby", :versions=>['1.1.x', '1.2.x', '1.3.x', '1.4.x', '1.5.x', '1.6.x', '1.7.x', '1.8.7']},
        ]

        def initialize(options={})
          super(options)
          debug_me "DeprecationCheck initialized"
        end

        def vuln?
        end

      end
    end
  end
end
