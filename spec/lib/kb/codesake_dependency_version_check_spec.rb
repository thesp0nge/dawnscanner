require 'spec_helper'

class DependencyMockup
  include Codesake::Dawn::Kb::DependencyCheck

  def initialize
    message = "This is a mock"
    super(
      :kind=>Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK, 
      :applies=>['sinatra', 'padrino', 'rails'],
      :message=> message
    )
    # self.debug = true

    self.safe_dependencies = [{:name=>'this_gem', :version=>['0.3.0', '1.3.3', '2.3.3', '9.4.31.2']}]
  end
end


describe "The security check for gem dependency should" do
  before(:all) do
    @check = DependencyMockup.new
  end
  # let (:check) {Mockup.new}

  it "fires if vulnerable 0.2.9 version is detected" do
    @check.dependencies = [{:name=>"this_gem", :version=>'0.2.9'}]
    @check.vuln?.should    be_true
  end
  it "doesn't fire if not vulnerable 0.4.0 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'0.4.0'}]
    @check.vuln?.should    be_false
  end

  it "fires if vulnerable 1.3.2 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'1.3.2'}]
    @check.vuln?.should    be_true
  end

  it "doesn't fire if not vulnerable 1.4.2 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'1.4.2'}]
    @check.vuln?.should    be_false
  end
end
