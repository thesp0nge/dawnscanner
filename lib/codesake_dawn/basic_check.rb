module Codesake
  module Dawn
    class BasicCheck

      attr_reader :target_version
      attr_reader :fixes_version
      attr_reader :grep_string
      attr_reader :name

      def initialize(options={})

        @target_version = options[:target_version]
        @fixes_version  = options[:fixes_version]
        @grep_string    = options[:grep_string]
        @name           = options[:name]
      end

      def applies?
        false
      end

    end
  end
end
