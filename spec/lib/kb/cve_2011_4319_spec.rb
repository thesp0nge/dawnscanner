require 'spec_helper'
describe "The CVE-2011-4319 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2011_4319.new
		# @check.debug = true
	end
  it "fires when vulnerable rails version it has been found (2.3.12)" do
    @check.dependencies = [{:name=>"rails", :version=>'2.3.12'}]
    @check.vuln?.should   == true
  end
  it "fires when vulnerable rails version it has been found (3.0.10)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.10'}]
    @check.vuln?.should   == true
  end
  it "fires when vulnerable rails version it has been found (3.1.1)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.10'}]
    @check.vuln?.should   == true
  end
  it "doesn't fire when safe rails version it has been found (2.3.13)" do
    @check.dependencies = [{:name=>"rails", :version=>'2.3.13'}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when safe rails version it has been found (2.3.14)" do
    @check.dependencies = [{:name=>"rails", :version=>'2.3.14'}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when safe rails version it has been found (3.0.11)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.11'}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when safe rails version it has been found (3.0.12)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.12'}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when safe rails version it has been found (3.1.2)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.1.2'}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when safe rails version it has been found (3.2.0)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.0'}]
    @check.vuln?.should   == false
  end
          # self.safe_dependencies = [{:name=>"rails", :version=>['2.3.13', '3.0.11', '3.1.2']}]
end
