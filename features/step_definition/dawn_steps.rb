Given /^the generic project "(.*?)" doesn't exist$/ do |file|
  FileUtils.rm(file) if File.exists?(file)
end

Given /^the hello world rails project does exist$/ do
  system("cp -a ./spec/support/hello_world_3.2.13 /tmp") unless File.exists?("/tmp/hello_world_3.2.13")
end


