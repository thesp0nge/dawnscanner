require 'rake'

namespace :dawn do

  desc 'Execute codesake-dawn on the current directory'
  task :require do
    begin
      require 'codesake-dawn'
    rescue LoadError => e
      if defined?(Rails)
        Rake::Task['dawn:require_environment'].invoke
      else
        raise e
      end
    end
  end
  task :require_environment do
    if defined?(Rails)
      Rake::Task['environment'].invoke
    end
    require 'codesake-dawn'
  end

  task :run do
    system "dawn ."
  end
end
