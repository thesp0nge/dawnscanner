require 'spec_helper'


describe "The Dawn engine for padrino applications" do 
  before(:all) do 
    @engine = Dawn::Padrino.new('./spec/support/hello_world_padrino')
  end
    

  it "has a proper name" do
    @engine.name.should   ==    "padrino"
  end

  it "has a valid target" do
    @engine.target.should ==   "./spec/support/hello_world_padrino"
    @engine.target_is_dir?.should  be_true
  end

  it "detects the applications declared in config/apps.rb" do
    @engine.should  respond_to(:detect_apps)
    @engine.apps.should_not     be_nil
    @engine.apps.count.should   == 3
  end

  it "creates a valid pool of Sinatra engines" do
    @engine.apps[0].mount_point.should == "/"
    @engine.apps[1].mount_point.should == "/log"
    @engine.apps[2].mount_point.should == "/dispatcher"
  end


  it "has a good Gemfile.lock" do
    @engine.has_gemfile_lock?.should   be_true
  end

  it "detects padrino v0.11.2" do
    @engine.mvc_version.should   == "0.11.2"
  end

  
  # describe "analyzing the main application" do
  # end
  
  
end
