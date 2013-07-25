module Codesake
  module Dawn
    module Utils

      def debug_me(msg)
        $logger.log(msg) if @debug
      end
    end
  end
end
