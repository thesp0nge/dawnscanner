module Dawn
  class GemfileLock
    include Dawn::Engine

    def initialize(dir = "./", filename = "", guessed_mvc)
      super(dir, "Gemfile.lock", {:gemfile_name=>filename, :guessed_mvc=>guessed_mvc})
    end

  end
end
