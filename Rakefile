require "bundler/gem_tasks"
require "rspec/core/rake_task"
# require "highline/import"

require 'cucumber'
require 'cucumber/rake/task'

require 'fileutils'
require "codesake/dawn/utils"
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
    file.puts "\t\t\t\t# Include the testing skeleton for this CVE"
    file.puts "\t\t\t\t# include PatternMatchCheck"
    file.puts "\t\t\t\t# include DependencyCheck"
    file.puts "\t\t\t\t# include RubyVersionCheck"
    file.puts ""
    file.puts "\t\t\t\tdef initialize"
    file.puts "\t\t\t\tend"
    file.puts "\t\t\tend"
    file.puts "\t\tend"
    file.puts "\tend"
    file.puts "end"
  end
  puts "#{rb_filename} created"

  open(spec_filename, "w") do |file|
    file.puts "require 'spec_helper'"

    file.puts "describe \"The #{name} vulnerability do\""
    file.puts "\tbefore(:all) do"
    file.puts "\t\t@check = Codesake::Dawn::Kb::#{class_name}.new"
    file.puts "\t\t# @check.debug = true"
    file.puts "\tend"
    file.puts "\tit \"you may want to test something here...\""
    file.puts "end"
  end
  puts "#{spec_filename} created"

  puts "*** PLEASE IMPLEMENT TEST FOR #{name} IN spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD THIS CODE IN lib/codesake/dawn/knowledge_base.rb in order to reflect changes"
  puts "require \"codesake/dawn/kb/#{class_name.downcase}\""
  puts "it \"must have test for #{name}\" do"
  puts "  sc = kb.find(\"#{name}\")"
  puts "  sc.should_not   be_nil"
  puts "  sc.class.should == Codesake::Dawn::Kb::#{class_name}"
  puts "end"


end



desc "Create a new Generic security check"
task :new_check, :name do |t,args| 
  name      = args.name
  SRC_DIR   = "./lib/codesake/dawn/kb/"
  SPEC_DIR  = "./spec/lib/kb/"

  raise "### It seems that #{name} is already in Dawn knowledge base" unless Codesake::Dawn::KnowledgeBase.find(nil, name).nil?
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
    file.puts "\t\t\t\t# Include the testing skeleton for this Security Check"
    file.puts "\t\t\t\t# include PatternMatchCheck"
    file.puts "\t\t\t\t# include DependencyCheck"
    file.puts "\t\t\t\t# include RubyVersionCheck"
    file.puts ""
    file.puts "\t\t\t\tdef initialize"
    file.puts "\t\t\t\tend"
    file.puts "\t\t\tend"
    file.puts "\t\tend"
    file.puts "\tend"
    file.puts "end"
  end
  puts "#{rb_filename} created"

  open(spec_filename, "w") do |file|
    file.puts "require 'spec_helper'"

    file.puts "describe \"The #{name} vulnerability do\""
    file.puts "\tbefore(:all) do"
    file.puts "\t\t@check = Codesake::Dawn::Kb::#{class_name}.new"
    file.puts "\t\t# @check.debug = true"
    file.puts "\tend"
    file.puts "\tit \"you may want to test something here...\""
    file.puts "end"
  end
  puts "#{spec_filename} created"


  puts "*** PLEASE IMPLEMENT TEST FOR #{name} IN spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD THIS CODE IN lib/codesake/dawn/knowledge_base.rb in order to reflect changes"
  puts "require \"codesake/dawn/kb/#{class_name.downcase}\""
  puts "it \"must have test for #{name}\" do"
  puts "  sc = kb.find(\"#{name}\")"
  puts "  sc.should_not   be_nil"
  puts "  sc.class.should == Codesake::Dawn::Kb::#{class_name}"
  puts "end"


end
