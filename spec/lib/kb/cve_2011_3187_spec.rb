require 'spec_helper'
describe "The CVE-2011-3187 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2011_3187.new
		# @check.debug = true
	end
  it "fires when vulnerable rails version it has been found (3.0.5)" do
    @check.dependencies = [{:name=>'rails', :version=>'3.0.5'}]
    @check.vuln?.should == true
  end
  it "doesn't fire when safe rails version it has been found (3.0.6)" do
    @check.dependencies = [{:name=>'rails', :version=>'3.0.6'}]
    @check.vuln?.should == false
  end
  it "doesn't fire when safe rails version it has been found (3.1.6)" do
    @check.dependencies = [{:name=>'rails', :version=>'3.1.6'}]
    @check.vuln?.should == false
  end
  it "doesn't fire when safe rails version it has been found (2.3.16)" do
    @check.dependencies = [{:name=>'rails', :version=>'2.3.16'}]
    @check.vuln?.should == false
  end
          # self.safe_dependencies = [{:name=>"rails", :version=>['3.0.6']}]
end
