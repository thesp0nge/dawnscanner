require 'spec_helper'

describe "The Codesake::Dawn engine for sinatra applications" do
  before(:all) {@engine= Codesake::Dawn::Sinatra.new('./spec/support/sinatra-template')}

  it "has a proper name" do
    @engine.name.should   ==    "sinatra"
  end

  it "has a valid target" do
    @engine.target.should ==   "./spec/support/sinatra-template"
    @engine.target_is_dir?.should  be_true
  end

  it "has a good Gemfile.lock" do
    @engine.has_gemfile_lock?.should   be_true
  end

  it "detects a sinatra 1.2.6" do
    @engine.mvc_version.should   == "1.2.6"
  end

  it "has some check in the knowledge base"
  it "has check for CVE-2013-1800"




end
