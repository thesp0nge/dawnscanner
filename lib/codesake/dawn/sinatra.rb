require "codesake/dawn/engine"
require 'ruby_parser'

module Codesake
  module Dawn
    class Sinatra
      include Codesake::Dawn::Engine

      attr_reader :sinks
      attr_reader :appname

      # mount_point is the mounting point for this Sinatra application. It's
      # filled up only in padrino engines
      attr_reader :mount_point

      def initialize(dir=nil, mp=nil)
        super(dir, "sinatra")
        @appname = detect_appname(self.target)
        error! if self.appname == ""
        @views = detect_views
        @sinks = detect_sinks(self.appname) unless self.appname == ""
        @reflected_xss = detect_reflected_xss unless self.appname == "" || !@views
        @mount_point = (mp.nil?)? "" : mp
      end

      # TODO: appname should be hopefully autodetect from config.ru
      def detect_appname(target)
        return "app.rb" if File.exist?(File.join(self.target, "app.rb"))
        return "application.rb" if File.exist?(File.join(self.target, "application.rb"))
        file_array = Dir.glob(File.join("#{target}", "*.rb"))
        return file_array[0] if ! file_array.nil? and file_array.count == 1
        return "" # gracefully failure
      end

      def detect_reflected_xss
        ret = []
        @views.each do |v|
          view_content = File.read(v[:filename])
          @sinks.each do |sink|
            if view_content.match(sink[:sink_name])
              sink[:sink_view] = v[:filename]
              ret << sink
            end
          end
        end
        ret
      end

      def detect_sinks(appname=nil)
        ret = []
        appname = "app.rb" if appname.nil? and self.appname == ""
        app_rb = File.readlines(File.join(self.target, appname)) if File.exist?(File.join(self.target, appname))
        return [] if app_rb.nil?

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

                    ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source, :sink_file=>appname, :sink_evidence=>line}
                  end
                  if body[0][0] == :ivar
                    sink_name=body[0][1].to_s
                    sink_pos=body[2][1].to_i
                    sink_source=body[3][3][1]

                    ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source, :sink_file=>appname, :sink_evidence=>line}
                  end

                end
              end

              # a = params["foo"]
              if (! t.nil? and t.sexp_type == :iasgn)
                body = t.sexp_body.to_a
                if is_assignement_from_params?(body, :iasgn)
                  sink_name = body[0].to_s
                  sink_source = "#{body[1][3][1].to_s}"
                  ret << {:sink_name=>sink_name, :sink_kind=>:params, :sink_line=>i+1, :sink_source=>sink_source, :sink_file=>appname, :sink_evidence=>line}
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
        return build_view_array(File.join(self.target, "views")) if File.exist?(File.join(self.target, "views"))
        []
      end

      # e = Haml::Engine.new(File.read(template))
      # e.precompiled  and grep for format_script


    end
  end
end
