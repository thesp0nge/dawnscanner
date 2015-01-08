  module Dawn
    module Kb
      class DeprecationCheck
        include BasicCheck

        DEPRECATION_MATRIX = [
          # {:gem=>"rails", :versions=>['0.x', '1.x', '2.x']},
          # {:gem=>"sinatra", :versions=>['0.x', '1.x', '2.x']},
          # {:gem=>"padrino", :versions=>['0.x', '1.x', '2.x']},
          {:gem=>"ruby", :versions=>['1.1.x', '1.2.x', '1.3.x', '1.4.x', '1.5.x', '1.6.x', '1.7.x', '1.8.7']},
        ]

        attr_accessor :detected
        attr_accessor :enable_warning

        def initialize(options={})
          super(options)
          @enable_warning ||= options[:enable_warning]
          debug_me "DeprecationCheck initialized"
          $logger.warn "MVC deprecation check is disable by now" unless self.enable_warning.nil?
        end

        def vuln?
          debug_me "vuln? @detected is #{@detected}"
          v = Dawn::Kb::VersionCheck.new
          v.debug = self.debug
          v.detected = @detected[:version]

          DEPRECATION_MATRIX.each do |dm|
            v.deprecated = dm[:versions] if dm[:gem] == @detected[:gem]
          end
          return false if v.deprecated.nil?
          return v.is_detected_deprecated?
        end

      end
    end
  end
