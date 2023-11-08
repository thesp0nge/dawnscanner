require "spec_helper"

describe "A single ruby file with a Sinatra application " do
  before (:all) do
    @engine = Dawn::Core.detect_mvc("./spec/support/sinatra_hello_app.rb")
  end
  it "is a good target too" do
    expect(@engine).not_to be_nil
  end

  it "is recognized as a Sinatra app" do
    expect(@engine).to be_a Dawn::Sinatra
  end
end
