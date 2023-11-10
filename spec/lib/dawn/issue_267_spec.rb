require "spec_helper"

describe "This vulnerable Sinatra application " do
  before (:all) do
    $stderr.close
    @engine = Dawn::Core.detect_mvc("./spec/support/reflected_xss_sinatra_app.rb")
  end
  it "is a good target too" do
    expect(@engine).not_to be_nil
  end

  it "is recognized as a Sinatra app" do
    expect(@engine).to be_a Dawn::Sinatra
  end

  it "is named correctly" do
    expect(@engine.appname).to eq("reflected_xss_sinatra_app.rb")
  end

  it "contains a vulnerability" do
    expect(@engine.count_vulnerabilities).to be > 0
  end

end
