require 'spec_helper'

describe "The security check for Ruby interpreter version" do
  before(:all) do
    @check = Dawn::Kb::RubyVersionCheck.new
    @check.message = "This is a mock"
    @check.kind=Dawn::KnowledgeBase::RUBY_VERSION_CHECK
    @check.applies=['sinatra', 'padrino', 'rails']
    @check.safe_rubies = [{:version=>"1.9.3", :patchlevel=>"p392"}, {:version=>"2.0.0", :patchlevel=>"p0"}]
  end

  it "fires if ruby version is vulnerable" do
    check.detected_ruby = {:version=>"1.9.2", :patchlevel=>"p10000"}
    expect(check.vuln?).to    eq(true)
  end
  it "doesn't fire if ruby version is not vulnerable and patchlevel is not vulnerable" do
    check.detected_ruby = {:version=>"1.9.4", :patchlevel=>"p10000"}
    expect(check.vuln?).to    eq(false)
  end

  it "doesn't fire if ruby version is vulnerable and patchlevel is not vulnerable" do
    check.detected_ruby = {:version=>"1.9.3", :patchlevel=>"p10000"}
    expect(check.vuln?).to    eq(false)
  end

  it "fires if ruby version is vulnerable and patchlevel is vulnerable" do
    check.detected_ruby = {:version=>"1.9.3", :patchlevel=>"p391"}
    expect(check.vuln?).to    eq(true)
  end
end
