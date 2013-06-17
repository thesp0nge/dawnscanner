require "codesake/dawn/engine"
require 'ruby_parser'

module Codesake
  module Dawn
    class Sinatra
      include Codesake::Dawn::Engine

      def initialize(dir=nil)
        super(dir, "sinatra")
      end

      def detect_sinks(appname=nil)
        ret = []
        # TODO: appname should be an engine attribute and hopefully autodetect from config.ru
        appname = "app.rb" if appname.nil?
        app_rb = File.readlines(File.join(self.target, appname)) if File.exist?(File.join(self.target, appname))

        parser = RubyParser.new

        app_rb.each_with_index do |line, i|
          line = line.chomp

          unless line.match(/params/).nil?

            begin
              t = parser.parse(line)

              # a[1] = params["foo"]
              #
              if (! t.nil? and t.sexp_type == :attrasgn)
                body = t.sexp_body.to_a

                if is_assignement_from_params?(body, :attrasgn)

                  if body[0][0] == :call
                    sink_name=body[0][2].to_s unless body[1].to_s == "[]=" 
                    sink_name="#{body[2].to_a[1].to_s}" if body[1].to_s == "[]=" # the sink is assigned to an Array

                    sink_source = "#{body[3].to_a[1][2].to_s}[#{body[3].to_a[3][1].to_s}]"

                    ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source}
                  end
                  if body[0][0] == :ivar
                    sink_name=body[0][1].to_s
                    sink_pos=body[2][1].to_i
                    sink_source=body[3][3][1]

                    ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source}
                  end

                end
              end

              # a = params["foo"]
              if (! t.nil? and t.sexp_type == :iasgn)
                body = t.sexp_body.to_a
                if is_assignement_from_params?(body, :iasgn)
                  sink_name = body[0].to_s
                  sink_source = "#{body[1][3][1].to_s}"
                  ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source }
                end
              end
            rescue Racc::ParseError => e
              # TODO: we must pass logger instance to engines if we want some error message
              # For now... silently discard parse errors
              return []
            end
          end

        end

        ret
      end


      def is_assignement_from_params?(body, kind)
        return ( ! body[3].nil? and body[3].to_a[1][2].to_s == "params") if kind == :attrasgn
        return ( ! body[1].nil? and ! body[1][1].nil? and body[1][1][2].to_s == "params") if kind == :iasgn
      end

      def detect_views
        build_view_array(File.join(self.target, "views")) if File.exist?(File.join(self.target, "views"))
      end

      # e = Haml::Engine.new(File.read(template))
      # e.precompiled  and grep for format_script


    end
  end
end
