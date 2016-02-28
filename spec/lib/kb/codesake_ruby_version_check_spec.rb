require 'spec_helper'

class Mockup
  include Dawn::Kb::RubyVersionCheck

  def initialize
    message = "This is a mock"
    super(
      :kind=>Dawn::KnowledgeBase::RUBY_VERSION_CHECK, 
      :applies=>['sinatra', 'padrino', 'rails'],
      :message=> message
    )
    # self.debug = true

    self.safe_rubies = [{:version=>"1.9.3", :patchlevel=>"p392"}, {:version=>"2.0.0", :patchlevel=>"p0"}]
  end
end

describe "The security check for Ruby interpreter version" do
  let (:check) {Mockup.new}

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
