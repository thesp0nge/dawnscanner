module Dawn
  class GemfileLock
    include Dawn::Engine

    def initialize(dir = "./")
      super(dir, "Gemfile.lock", {:gemfile_name=>"Gemfile.lock", :guessed_mvc=>Dawn::Core.guess_mvc(File.join(dir, "Gemfile.lock"))})
    end

  end
end
