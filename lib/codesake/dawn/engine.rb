module Codesake
  module Dawn
    module Engine
      attr_reader :target

      def initialize(dir=nil)
        set_target(dir) unless dir.nil?
      end

      def set_target(dir)
        @target = dir
        set_project_target(dir)
      end

      def load_knowledge_base

      end

      def can_apply?
        false
      end

      def get_framework_version
        ""
      end

    end
  end
end
