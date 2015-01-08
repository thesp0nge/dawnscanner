require 'spec_helper'
describe "The CVE-2013-2119 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2119.new
		# @check.debug = true
	end
  it "fires when vulnerable passenger version is used" do
    @check.dependencies = [{:name=>"passenger", :version=>"4.0.4"}]
    @check.vuln?.should   == true
  end
  it "fires when vulnerable passenger version is used" do
    @check.dependencies = [{:name=>"passenger", :version=>"4.0.0"}]
    @check.vuln?.should   == true
  end
  it "fires when vulnerable passenger version is used" do
    @check.dependencies = [{:name=>"passenger", :version=>"3.0.20"}]
    @check.vuln?.should   == true
  end
  it "doesn't fire when not vulnerable passenger version is used" do
    @check.dependencies = [{:name=>"passenger", :version=>"4.0.5"}]
    @check.vuln?.should   == false
  end
  it "doesn't fire when not vulnerable passenger version is used" do
    @check.dependencies = [{:name=>"passenger", :version=>"3.0.21"}]
    @check.vuln?.should   == false
  end
end
