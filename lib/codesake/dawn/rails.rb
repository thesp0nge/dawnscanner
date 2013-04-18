module Codesake
  module Dawn
    class Rails

      attr_reader :target
      attr_reader :gemfile_lock
      attr_reader :rails_version

      def initialize(dir)
        @target = dir
        @rails_version = ""
        @gemfile_lock = @target + File::SEPARATOR + "Gemfile.lock" 
        @rails_version = get_rails_version
      end

      def get_rails_version
        ver = ""
        my_dir = Dir.pwd
        Dir.chdir(@target)
        lockfile = Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock"))
        lockfile.specs.each do |s|
          ver= s.version.to_s if s.name == "rails"
        end
        Dir.chdir(my_dir)
        return ver
      end

      def has_gemfile_lock?
        File.exist?(@gemfile_lock)
      end

      def is_dir?
        File.directory?(@target)
      end
      def is_rails?
        (@version != "")
      end

      def is_good_project?
        is_dir? and is_rails?
      end


    end
  end
end
