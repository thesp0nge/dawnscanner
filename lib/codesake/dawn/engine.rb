module Codesake
  module Dawn
    module Engine
      attr_reader :target
      attr_reader :name
      attr_reader :gemfile_lock
      attr_reader :mvc_version

      def initialize(dir=nil)
        @name = ""
        @mvc_version = ""
        @gemfile_lock = ""
        set_target(dir) unless dir.nil?
      end

      def set_target(dir)
        @target = dir
        @gemfile_lock = File.join(@target, "Gemfile.lock" )
        @mvc_version = get_mvc_version
      end

      def is_dir?
        File.directory?(@target)
      end


      def load_knowledge_base

      end

      def can_apply?
        false
      end

      def get_mvc_version
        ver = ""
        return ver unless is_dir?
        return ver unless File.exist? File.join(@target, "Gemfile.lock")

        my_dir = Dir.pwd
        Dir.chdir(@target) 
        lockfile = Bundler::LockfileParser.new(Bundler.read_file("Gemfile.lock"))
        lockfile.specs.each do |s|
          ver= s.version.to_s if s.name == self.name
        end
        Dir.chdir(my_dir)
        return ver
      end

      def has_gemfile_lock?
        File.exist?(@gemfile_lock)
      end

      def is_good_mvc?
        (@mvc_version != "")
      end

      def can_apply?
        is_dir? and is_good_mvc?
      end

      def get_mvc_version
        "#{@rails} #{@mvc_version}" if is_good_mvc? 
      end


    end
  end
end
