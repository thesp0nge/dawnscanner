require 'spec_helper'


describe "The Dawn engine for padrino applications" do 
  before(:all) do 
    @engine = Dawn::Padrino.new('./spec/support/hello_world_padrino')
  end
    

  it "has a proper name" do
    expect(@engine.name).to   eq("padrino")
  end

  it "has a valid target" do
    expect(@engine.target).to eq("./spec/support/hello_world_padrino")
    expect(@engine.target_is_dir?).to  be_truthy
  end

  it "detects the applications declared in config/apps.rb" do
    expect(@engine).to  respond_to(:detect_apps)
    expect(@engine.apps).not_to     be_nil
    expect(@engine.apps.count).to   eq(3)
  end

  it "creates a valid pool of Sinatra engines" do
    expect(@engine.apps[0].mount_point).to eq("/")
    expect(@engine.apps[1].mount_point).to eq("/log")
    expect(@engine.apps[2].mount_point).to eq("/dispatcher")
  end


  it "has a good Gemfile.lock" do
    expect(@engine.has_gemfile_lock?).to   be_truthy
  end

  it "detects padrino v0.11.2" do
    expect(@engine.mvc_version).to   eq("0.11.2")
  end

  
  # describe "analyzing the main application" do
  # end
  
  
end
