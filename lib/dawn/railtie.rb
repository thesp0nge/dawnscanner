module Codesake
  module Dawn
    class Railtie < Rails::Railtie
      rake_tasks do
        require File.expand_path('../tasks', __FILE__)
      end
    end
  end
end
