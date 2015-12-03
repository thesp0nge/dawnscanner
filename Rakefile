require "bundler/gem_tasks"
require "rspec/core/rake_task"
# require "highline/import"

require 'cucumber'
require 'cucumber/rake/task'

require 'fileutils'
require "dawn/utils"
require "dawn/knowledge_base"

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty -x"
  t.fork = false
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["--color"]
end


task :default => [ :spec, :features, :'kb:create', :'kb:lint' ]
task :test => :spec
task :prepare => [:build, :'checksum:calculate', :'checksum:commit']
task :release => [:prepare]

namespace :version do
  desc 'Calculate some infos you want to put in version.rb'
  task :update do
    build_number  = `git describe --tags --long | cut -d \'-\' -f 2`
    commit_hash   = `git describe --tags --long | cut -d \'-\' -f 3`
    release       = Time.now.strftime("%Y%m%d")
    branch        = `git symbolic-ref HEAD 2> /dev/null`
    branch_name   = branch.split('/')[2].chomp
    a=[]
    File.open("VERSION", "r") do |f|
      a = f.readlines
    end
    version = a[a.length - 1].split('-')[0]# .chomp
    codename = a[a.length - 1].split('-')[1]

    File.open("./lib/dawn/version.rb", "w") do |f|

      f.puts("module Dawn")

      puts "#{branch_name}|"
      if branch_name != "master"
        av = version.split('.')
        f.puts "    VERSION = \"#{av[0]}.#{av[1]}.#{commit_hash.chop}\""
        f.puts "    CODENAME = \"#{codename.lstrip!.chop}\""
        f.puts "    RELEASE = \"(development)\""
      else
        puts "here"
        f.puts "    VERSION = \"#{version.rstrip!}\""
        f.puts "    CODENAME = \"#{codename.lstrip!.chop}\""
        f.puts "    RELEASE = \"#{release}\""
      end
      f.puts "    BUILD = \"#{build_number.chop}\""
      f.puts "    COMMIT = \"#{commit_hash.chop}\""
      f.puts "end"
    end
  end
end

# namespace :check do
# desc "Create a dependency check"
# task :dependency, :name do |t, args|
# end

# end
desc "Create a new CVE test"
task :cve, :name do |t,args|
  name      = args.name
  SRC_DIR   = "./lib/dawn/kb/"
  SPEC_DIR  = "./spec/lib/kb/"

  raise "### It seems that #{name} is already in Dawn knowledge base" unless Dawn::KnowledgeBase.find(nil, name).nil?
  raise "### Invalid CVE title: #{name}" if name.nil? or name.empty? or /CVE-\d{4}-\d{4}/.match(name).nil?
  raise "### No target directory: #{SRC_DIR}" unless Dir.exists?(SRC_DIR)
  raise "### No rspec directory: #{SPEC_DIR}" unless Dir.exists?(SPEC_DIR)

  puts "Adding #{name} to knowledge base..."

  rb_filename = SRC_DIR+name.downcase.gsub("-", "_")+".rb"
  spec_filename = SPEC_DIR+name.downcase.gsub("-", "_")+"_spec.rb"
  class_name = name.gsub("-", "_")

  open(rb_filename, "w") do |file|
    file.puts "module Dawn"
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
    file.puts "end"
  end
  puts "#{rb_filename} created"

  open(spec_filename, "w") do |file|
    file.puts "require 'spec_helper'"

    file.puts "describe \"The #{name} vulnerability\" do"
    file.puts "\tbefore(:all) do"
    file.puts "\t\t@check = Dawn::Kb::#{class_name}.new"
    file.puts "\t\t# @check.debug = true"
    file.puts "\tend"
    file.puts "\tit \"is reported when the vulnerable gem is detected\" do"
    file.puts "\t\t@check.dependencies = [{:name=>\"\", :version=>\"\"}]"
    file.puts "\t\t@check.vuln?.should   == true"
    file.puts "\tend"
    file.puts "\tit \"is not reported when a fixed release is detected\" do"
    file.puts "\t\t@check.dependencies = [{:name=>\"\", :version=>\"\"}]"
    file.puts "\t\t@check.vuln?.should   == false"
    file.puts "\tend"
    file.puts "end"
  end
  puts "#{spec_filename} created"

  puts "*** PLEASE IMPLEMENT TEST FOR #{name} IN ./spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD THIS CODE IN ./lib/dawn/knowledge_base.rb in order to reflect changes"
  puts "require \"dawn/kb/#{class_name.downcase}\""
  puts "it \"must have test for #{name}\" do"
  puts "  sc = kb.find(\"#{name}\")"
  puts "  sc.should_not   be_nil"
  puts "  sc.class.should == Dawn::Kb::#{class_name}"
  puts "end"


end

desc "Create a new OSVDB security check"
task :osvdb, :name do |t,args|
  name      = args.name
  SRC_DIR   = "./lib/dawn/kb/"
  SPEC_DIR  = "./spec/lib/kb/"

  raise "### It seems that #{name} is already in Dawn knowledge base" unless Dawn::KnowledgeBase.find(nil, name).nil?
  raise "### Invalid OSVDB identifier: #{name}" if name.nil? or name.empty? or /\d{6}/.match(name).nil?
  raise "### No target directory: #{SRC_DIR}" unless Dir.exists?(SRC_DIR)
  raise "### No rspec directory: #{SPEC_DIR}" unless Dir.exists?(SPEC_DIR)

  puts "Adding #{name} to knowledge base..."

  name = "OSVDB_"+name

  rb_filename = SRC_DIR+name.downcase.gsub("-", "_")+".rb"
  spec_filename = SPEC_DIR+name.downcase.gsub("-", "_")+"_spec.rb"
  class_name = name.gsub("-", "_")

  open(rb_filename, "w") do |file|
    file.puts "module Dawn"
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
    file.puts "end"
  end
  puts "#{rb_filename} created"

  open(spec_filename, "w") do |file|
    file.puts "require 'spec_helper'"

    file.puts "describe \"The #{name} vulnerability\" do"
    file.puts "\tbefore(:all) do"
    file.puts "\t\t@check = Dawn::Kb::#{class_name}.new"
    file.puts "\t\t# @check.debug = true"
    file.puts "\tend"
    file.puts "\tit \"is reported when the vulnerable gem is detected\" do"
    file.puts "\t\t@check.dependencies = [{:name=>\"\", :version=>\"\"}]"
    file.puts "\t\t@check.vuln?.should   == true"
    file.puts "\tend"
    file.puts "\tit \"is not reported when a fixed release is detected\" do"
    file.puts "\t\t@check.dependencies = [{:name=>\"\", :version=>\"\"}]"
    file.puts "\t\t@check.vuln?.should   == false"
    file.puts "\tend"
    file.puts "end"
  end
  puts "#{spec_filename} created"


  puts "*** PLEASE IMPLEMENT TEST FOR #{name} IN ./spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD THIS CODE IN ./lib/dawn/knowledge_base.rb in order to reflect changes"
  puts "require \"dawn/kb/#{class_name.downcase}\""
  puts "it \"must have test for #{name}\" do"
  puts "  sc = kb.find(\"#{name}\")"
  puts "  sc.should_not   be_nil"
  puts "  sc.class.should == Dawn::Kb::#{class_name}"
  puts "end"

end



desc "Create a new Generic security check"
task :check, :name do |t,args|
  name      = args.name
  SRC_DIR   = "./lib/dawn/kb/"
  SPEC_DIR  = "./spec/lib/kb/"

  raise "### It seems that #{name} is already in Dawn knowledge base" unless Dawn::KnowledgeBase.find(nil, name).nil?
  raise "### No target directory: #{SRC_DIR}" unless Dir.exists?(SRC_DIR)
  raise "### No rspec directory: #{SPEC_DIR}" unless Dir.exists?(SPEC_DIR)

  puts "Adding #{name} to knowledge base..."

  rb_filename = SRC_DIR+name.downcase.gsub("-", "_")+".rb"
  spec_filename = SPEC_DIR+name.downcase.gsub("-", "_")+"_spec.rb"
  class_name = name.gsub("-", "_")

  open(rb_filename, "w") do |file|
    file.puts "module Dawn"
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
    file.puts "end"
  end
  puts "#{rb_filename} created"

  open(spec_filename, "w") do |file|
    file.puts "require 'spec_helper'"

    file.puts "describe \"The #{name} vulnerability\" do"
    file.puts "\tbefore(:all) do"
    file.puts "\t\t@check = Dawn::Kb::#{class_name}.new"
    file.puts "\t\t# @check.debug = true"
    file.puts "\tend"
    file.puts "\tit \"is reported when...\""
    file.puts "end"
  end
  puts "#{spec_filename} created"


  puts "*** PLEASE IMPLEMENT TEST FOR #{name} IN ./spec/lib/dawn/codesake_knowledgebase_spec.rb in order to reflect changes"
  puts "*** PLEASE ADD THIS CODE IN ./lib/dawn/knowledge_base.rb in order to reflect changes"
  puts "require \"dawn/kb/#{class_name.downcase}\""
  puts "it \"must have test for #{name}\" do"
  puts "  sc = kb.find(\"#{name}\")"
  puts "  sc.should_not   be_nil"
  puts "  sc.class.should == Dawn::Kb::#{class_name}"
  puts "end"


end

namespace :kb do
  desc 'Check information lint'
  task :lint do
    Dawn::KnowledgeBase.new.all.each do |check|
      l = check.lint
      puts "check #{check.name} has this attribute(s) with a nil value: #{l.to_s}" unless l.size == 0
    end

  end

  desc 'Creates a KnowledgeBase.md file'
  task :create do
    checks = Dawn::KnowledgeBase.new.all
    open("KnowledgeBase.md", "w") do |file|
      file.puts "# Dawnscanner Knowledge base"
      file.puts "\nThe knowledge base library for dawnscanner version #{Dawn::VERSION} contains #{checks.count} security checks."
      file.puts "---"
      checks.each do |c|
        file.puts "* [#{c.name}](#{c.cve_link}): #{c.message}" if c.name.start_with?('CVE')
        file.puts "* [#{c.name}](#{c.osvdb_link}): #{c.message}" if c.name.start_with?('OSVDB')
        file.puts "* #{c.name}: #{c.message}" unless c.name.start_with?('CVE') && c.name.start_with?('OSVDB')
      end

      file.puts "\n\n_Last updated: #{Time.now.strftime("%a %d %b %T %Z %Y")}_"
    end
    puts "KnowledgeBase.md file successfully generated"

  end
end

require 'digest/sha1'
namespace :checksum do

desc 'Calculate gem checksum'
task :calculate do
  system 'mkdir -p checksum > /dev/null'
  built_gem_path = "pkg/dawnscanner-#{Dawn::VERSION}.gem"
  checksum = Digest::SHA1.new.hexdigest(File.read(built_gem_path))
  checksum_path = "checksum/dawnscanner-#{Dawn::VERSION}.gem.sha1"
  File.open(checksum_path, 'w' ) {|f| f.write(checksum) }

  puts "#{checksum_path}: #{checksum}"
end

desc 'Add and commit latest checksum'
task :commit do
  checksum_path = "checksum/dawnscanner-#{Dawn::VERSION}.gem.sha1"
  system "git add #{checksum_path}"
  system "git commit -v #{checksum_path} -m \"Adding #{Dawn::VERSION} checksum to repo\""
end
end

###############################################################################
# ruby-advisory-rb integration
###############################################################################

namespace :rubysec do
  desc 'Find new CVE bulletins to add to Dawn'
  task :find do
    git_url = 'git@github.com:rubysec/ruby-advisory-db.git'
    target_dir = './tmp/'
    system "mkdir -p #{target_dir}"
    system "rm -rf #{target_dir}ruby-advisory-db"
    system "git clone #{git_url} #{target_dir}ruby-advisory-db"
    list = []
    Dir.glob("#{target_dir}ruby-advisory-db/gems/*/*.yml") do |path|
      advisory = YAML.load_file(path)
      if advisory['cve']
        cve = "CVE-"+advisory['cve']
        # Exclusion
        # CVE-2007-6183 is a vulnerability in gnome2 ruby binding. Not a gem, I don't care
        # CVE-2013-1878 is a duplicate of CVE-2013-2617 that is in knowledge base
        # CVE-2013-1876 is a duplicate of CVE-2013-2615 that is in knowledge base
        exclusion = ["CVE-2007-6183", "CVE-2013-1876", "CVE-2013-1878"]
        if exclusion.include?(cve)
          puts "#{cve} is in the exclusion list"
        else
          found = Dawn::KnowledgeBase.find(nil, cve)
          puts "#{cve} NOT in dawn v#{Dawn::VERSION} knowledge base" unless found
          list << cve unless found
        end
      end
    end
    unless list.empty?
      File.open("missing_rubyadvisory_cvs_#{Time.now.strftime("%Y%m%d")}.txt", "w") do |f|
        f.puts "Missing CVE bulletins - v#{Dawn::VERSION} - #{Time.now.strftime("%d %B %Y")}"
        f.puts list
      end
    end
    system "rm -rf #{target_dir}ruby-advisory-db"

  end
end
