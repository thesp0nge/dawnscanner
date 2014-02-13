require 'rake'
desc 'Execute codesake-dawn on the current directory'
task :dawn do
  system "dawn ."
end
