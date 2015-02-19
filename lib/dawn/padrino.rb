require 'ruby_parser'
module Dawn
  class Padrino
    include Dawn::Engine

    attr_reader :apps

    def initialize(dir=nil)
      super(dir, "padrino", {:debug=>false}) 
      @apps = detect_apps
    end

    def get_sinatra_version
      self.connected_gems.each do |gem|
        return gem[:version] if gem[:name] == "sinatra"
      end

      return ""
    end
    def detect_apps

      apps_rb = File.join(@target, "config", "apps.rb")
      return nil unless File.exist?(apps_rb)
      lines = File.readlines(apps_rb)
      p = RubyParser.new
      apps = []

      lines.each do |line|
        if /^Padrino\.mount/ =~ line

          begin
            tree = p.parse(line)
            if ! tree.nil? && tree.sexp_type == :call
              body_a = tree.sexp_body.to_a
              debug_me("BODY_A=#{body_a[0]} - BODY_A_SIZE=#{body_a[0].size}")
              debug_me("IS_MOUNT_CALL? #{is_mount_call?(body_a[0])}")
              mp = body_a[2][1]
              debug_me("MP = #{mp}")

              # Padrino.mount('HelloWorldPadrino::App', :app_file => Padrino.root('app/app.rb')).to('/')
              sinatra_app_rb = body_a[0][4][2][3][1] if body_a[0].size == 5 && is_mount_call?(body_a[0]) 

              # Padrino.mount("HelloWorldPadrino:App").to('/')
              if body_a[0].size == 4

                # Defaulting the application name if mount point is /
                sinatra_app_rb = "app/app.rb" if mp == "/"

                # Take the app name as mountpoint/app.rb
                sinatra_app_rb = body_a[0][3][1].downcase+"/app.rb" unless mp == "/"

              end

              target = File.dirname(sinatra_app_rb )
              apps << Dawn::Sinatra.new(target, mp)
            end
          rescue Racc::ParseError => e
            debug_me(e.message)
          end
        end

        # if line.start_with?("Padrino.mount")

      end


      debug_me("sinatra version is: #{self.get_sinatra_version}")
      apps.each do |a|
        debug_me("detected sinatra application at #{a.mount_point} ")
      end
      apps
    end

    def is_mount_call?(a)
      return (a[0] == :call && a[1] == [:const, :Padrino] && a[2] == :mount)
    end

  end
end
