Given /^the generic project "(.*?)" doesn't exist$/ do |file|
  FileUtils.rm(file) if File.exists?(file)
end


