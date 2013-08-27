require 'ruby_parser'
module Codesake
  module Dawn
    class Padrino
      include Codesake::Dawn::Engine

      attr_reader :apps

      def initialize(dir=nil)
        super(dir, "padrino", {:debug=>true}) 
        @apps = detect_apps
      end

      def detect_apps

        apps_rb = File.join(@target, "config", "apps.rb")
        return nil unless File.exist?(apps_rb)
        lines = File.readlines(apps_rb)
        p = RubyParser.new

        lines.each do |line|
          if /^Padrino\.mount/ =~ line

            begin
              tree = p.parse(line)
              if ! tree.nil? && tree.sexp_type == :call
                body_a = tree.sexp_body.to_a
                mp = body_a[2][1]
                sinatra_app_rb = body_a[0][4][2][3][1] if is_mount_call?(body_a[0])
                debug_me("BODY_A=#{body_a[0]}")
                debug_me("IS_MOUNT_CALL? #{is_mount_call?(body_a[0])}")
                target = File.dirname(sinatra_app_rb )
                apps << Codesake::Dawn::Sinatra.new(target, mp)
              end
            rescue Racc::ParseError => e
              debug_me(e.message)
            end
          end

          
          # if line.start_with?("Padrino.mount")

        end
        []
      end

      def is_mount_call?(a)
        return (a[0] == :call && a[1] == [:const, :Padrino] && a[2] == :mount)
      end

    end
  end
end
