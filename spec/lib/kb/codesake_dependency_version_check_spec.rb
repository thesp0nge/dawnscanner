require 'spec_helper'

class DependencyMockup
  include Dawn::Kb::DependencyCheck

  def initialize
    message = "This is a mock"
    super(
      :kind=>Dawn::KnowledgeBase::DEPENDENCY_CHECK,
      :applies=>['sinatra', 'padrino', 'rails'],
      :message=> message
    )
    # self.debug = true

    self.safe_dependencies = [{:name=>'this_gem', :version=>['0.3.0', '1.3.3', '2.3.3', '2.4.2', '9.4.31.2']}]
    self.save_major = true
  end
end


describe "The security check for gem dependency should" do
  before(:all) do
    @check = DependencyMockup.new
  end
  # let (:check) {Mockup.new}

  it "gives an unkown priority value" do
    @check.priority.should == "unknown"
  end

  it "gives the assigned priority value" do
    @check.priority = :critical
    @check.priority.should == "critical"
  end
  it "gives an unknown severity since no CVSS is provided and no severity is given" do
    @check.severity.should  == "unknown"
  end

  it "gives the severity level provided. No CVSS is here" do
    @check.severity = :critical
    @check.severity.should  == "critical"
  end

  it "fires if vulnerable 0.2.9 version is detected" do
    @check.dependencies = [{:name=>"this_gem", :version=>'0.2.9'}]
    @check.vuln?.should    == true
  end
  it "doesn't fire if not vulnerable 0.4.0 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'0.4.0'}]
    @check.vuln?.should    == false
  end

  it "fires if vulnerable 1.3.2 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'1.3.2'}]
    @check.vuln?.should    == true
  end

  it "doesn't fire if not vulnerable 1.4.2 version is found" do
    @check.dependencies = [{:name=>"this_gem", :version=>'1.4.2'}]
    @check.vuln?.should    == false
  end

  it "doesn't fires when a non vulnerable version is found and there is a fixed version with higher minor release but I asked to honor the minor version (useful with rails gem)" do
    @check.dependencies = [{:name=>"this_gem", :version=>'2.3.3'}]
    @check.save_minor = true
    @check.vuln?.should    == false
  end
  it "fires when a vulnerable version (2.3.2) is found even if I asked to save minors..." do
    @check.dependencies = [{:name=>"this_gem", :version=>'2.3.2'}]
    @check.save_minor = true
    @check.vuln?.should    == true

  end


end
