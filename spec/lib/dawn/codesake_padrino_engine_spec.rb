require 'spec_helper'


describe "The Codesake::Dawn engine for padrino applications" do 
  before(:all) {@engine = Codesake::Dawn::Engine::Padrino.new('./spec/support/hello_world_padrino')}
  it "has a proper name"
  it "detects the applications declared in config/apps.rb"
  it "has a valid target"
  it "creates a valid pool of Sinatra engines"

  it "has a good Gemfile.lock"
  it "detects padrino v0.11.2"
  
  # describe "analyzing the main application" do
  # end
  
  
end
