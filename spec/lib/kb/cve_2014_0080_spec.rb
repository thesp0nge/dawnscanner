require 'spec_helper'
describe "The CVE-2014-0080 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_0080.new
		# @check.debug = true
	end
  it "affects version 4.0.0" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.0'}]
    @check.vuln?.should == true
  end
  it "affects version 4.0.2" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.2'}]
    @check.vuln?.should == true
  end
  it "affects version 4.0.1" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.1'}]
    @check.vuln?.should == true
  end
  it "affects version 4.1.0.beta1" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.0.beta1'}]
    @check.vuln?.should == true
  end

  it "doesn't affect version 4.0.3" do 
    @check.dependencies = [{:name=>"rails", :version=>'4.0.3'}]
    @check.vuln?.should == false
  end
end
