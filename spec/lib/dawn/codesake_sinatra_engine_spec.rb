require 'spec_helper'

describe "The Codesake::Dawn engine for sinatra applications" do
  before(:all) {@engine= Codesake::Dawn::Sinatra.new('./spec/support/sinatra-safe')}

  it "has a proper name" do
    @engine.name.should   ==    "sinatra"
  end

  it "has a valid target" do
    @engine.target.should ==   "./spec/support/sinatra-safe"
    @engine.target_is_dir?.should  be_true
  end

  it "has a good Gemfile.lock" do
    @engine.has_gemfile_lock?.should   be_true
  end

  it "detects a sinatra 1.4.2" do
    @engine.mvc_version.should   == "1.4.2"
  end

  it "has some check in the knowledge base" do
    @engine.checks.should_not be_nil 
    @engine.checks.should_not be_empty
  end
  it "has check for CVE-2013-1800" do
    Codesake::Dawn::KnowledgeBase.find(@engine.checks, "CVE-2013-1800").should_not  be_nil
  end

  it "applies all checks" do
    @engine.apply_all.should  be_true
  end
  it "applies check for CVE-2013-1800" do
    @engine.apply("CVE-2013-1800").should   be_true
  end
  
  it "applies check for \"Not revised code\"" do
    @engine.apply("Not revised code").should  be_true
  end 

  describe "applied to sinatra-safe application" do
    it "reports it's not vulnerable to CVE-2013-1800" do
      @engine.is_vulnerable_to?("CVE-2013-1800").should be_false
    end

    it "reports it's not vulnerable to \"Not revised code\"" do
      @engine.is_vulnerable_to?("Not revised code").should  be_false
    end

    it "reports it has no vulnerabilities" do
      @engine.vulnerabilities.should  be_empty
    end
  end  

  describe "applied do the sinatra-vulnerable application do" do
    before (:all) {@engine= Codesake::Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')}
    it "has a valid target" do
      @engine.target.should ==   "./spec/support/sinatra-vulnerable"
      @engine.target_is_dir?.should  be_true
    end

    it "detects running ruby as the one to be checked against" do
      @engine.ruby_version.should == RUBY_VERSION
    end

    it "reports it's vulnerable to CVE-2013-1800" do
      @engine.is_vulnerable_to?("CVE-2013-1800").should be_true
    end

    it "reports it's vulnerable to \"Not revised code\"" do
      @engine.is_vulnerable_to?("Not revised code").should  be_true
    end

    it "reports it has vulnerabilities" do
      @engine.vulnerabilities.should_not  be_empty
    end

    it "applies automagically all the tests if no test has been applied" do
      e2 =  Codesake::Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')
      e2.vulnerabilities.should_not be_empty
    end
  end
end
