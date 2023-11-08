module Dawn
  module Processor
    class Require < AST::Processor
      attr_reader :is_sinatra

      def initialize()
        @is_sinatra = false
        super()
      end

      def on_send(node)
        if (node.children[1].to_s == "require")
          if node.children[2].children[0].to_s == "sinatra"
            @is_sinatra = true
          end
        end
      end
    end
  end
end
