require 'rake'

namespace :dawn do

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

  desc 'Execute codesake-dawn on the current directory'
  task :run do
    system "dawn ."
  end
end
