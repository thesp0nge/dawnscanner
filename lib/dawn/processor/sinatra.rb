module Dawn
  module Processor
    class Sinatra < AST::Processor

      attr_reader :routes

      def initialize()
        @routes =[]
        super()
      end

      ##
      # Parses a block node.
      # In a Sinatra application, a block under the root of AST is a route.
      #
      # {:method=>"get|post|put|patch|delete", :name="the route name", :params=>["A", "B", "C"]}
      def on_block(node)
		r= {}


        r[:method] 	= node.children[0].children[1].to_s.upcase
        r[:name]	= node.children[0].children[2].children[0]

        code = node.children[2]
        r[:params]  = [] if code.type == :str # a constant string

        # there is some code in the route definition...
        if code.type == :begin
		# (begin
		#   (lvasgn :p
		#     (send
		#       (send nil :params) :[]
		#       (sym :comment)))
		#   (dstr
		#     (str "<p>Thanks for this comment:i ")
		#     (begin
		#       (lvar :p))
		#     (str " </p>")))))
			code.children.each do |child|
			  # local variable assignement
			  if child.type == :lvasgn
				# First child is the variable name
				source = {}
				source[:name] = child.children[0]

# TODO: Da qui stiamo gestendo il lvasgn
				block = child.children[1]
				if block.children.count == 3
					$logger.error block.children[0].children[2]
				end

			  end
				# $logger.error child
			end

        end
        @routes << r

      end
    end
  end
end
