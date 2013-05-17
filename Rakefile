require "bundler/gem_tasks"
require "rspec/core/rake_task"
# require "highline/import"

require 'cucumber'
require 'cucumber/rake/task'

require 'fileutils'
require "codesake/dawn/knowledge_base"

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty -x"
  t.fork = false
end

RSpec::Core::RakeTask.new do |t| 
  t.rspec_opts = ["--color"]
end


task :default => [ :spec, :features ]
task :test => :spec

desc "Create a new CVE test"
task :new_cve, :name do |t,args| 
  name      = args.name
  SRC_DIR   = "./lib/codesake/dawn/kb/"
  SPEC_DIR  = "./spec/lib/kb/"

  raise "### It seems that #{name} is already in Dawn knowledge base" unless Codesake::Dawn::KnowledgeBase.find(nil, name).nil?
  raise "### Invalid CVE title: #{name}" if name.nil? or name.empty? or /CVE-\d{4}-\d{4}/.match(name).nil?
  raise "### No target directory: #{SRC_DIR}" unless Dir.exists?(SRC_DIR)
  raise "### No rspec directory: #{SPEC_DIR}" unless Dir.exists?(SPEC_DIR)

  puts "Adding #{name} to knowledge base..."

  rb_filename = SRC_DIR+name.downcase.gsub("-", "_")+".rb"
  spec_filename = SPEC_DIR+name.downcase.gsub("-", "_")+"_spec.rb"
  class_name = name.gsub("-", "_")

  open(rb_filename, "w") do |file|
    file.puts "module Codesake"
    file.puts "\tmodule Dawn"
    file.puts "\t\tmodule Kb"
    file.puts "\t\t\t# Automatically created with rake on #{Time.now.strftime('%Y-%m-%d')}"
    file.puts "\t\t\tclass #{class_name}"
    file.puts "\t\t\t\t#"
    file.puts "\t\t\t\t# Include the testing skeleton for this CVE"
    file.puts "\t\t\t\t# include PatternMatchCheck"
    file.puts "\t\t\t\t# include DependencyCheck"
    file.puts "\t\t\t\t#"
    file.puts ""
    file.puts ""
    file.puts "\t\t\t\tdef initialize"
    file.puts "\t\t\t\tend"
    file.puts "\t\t\tend"
    file.puts "\t\tend"
    file.puts "\tend"
    file.puts "end"
  end
  puts "#{rb_filename} created"

  # open(spec_filename, "w") do |file|
  #   file.puts "require \\"spec_helper\\""
  #   file.puts "# Automatically created with rake on #{Time.now.strftime('%Y-%m-%d')}"
  #   file.puts ""
  #   file.puts "describe \\"Security check for #{name}\\" do"
  #   file.puts "\\tlet(:check) {Codesake::Dawn::Kb::#{class_name}.new}"
  #   file.puts "\\tit \\"should be added to rspec\\""
  #   file.puts "end"
  # end
  # puts "#{spec_filename} created"

  puts "*** PLEASE ADD #{name} to spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD #{name} to lib/codesake/dawn/knowledge_base.rb in order to reflect changes"
end
