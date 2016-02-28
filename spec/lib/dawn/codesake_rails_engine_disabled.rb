require 'spec_helper'

describe "The Dawn engine for rails applications" do
  before(:all){@engine = Dawn::Rails.new}

  it "detects the version used in the hello_world_3.1.0 application" do
    @engine.set_target("./spec/support/hello_world_3.1.0")
    expect(@engine.ruby_version[:version]).to eq(RUBY_VERSION)
    expect(@engine.ruby_version[:patchlevel]).to eq("p#{RUBY_PATCHLEVEL}")
  end

end
