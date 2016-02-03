require 'spec_helper'
describe "The CVE-2015-7541 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7541.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"colorscore", :version=>"0.0.4"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"colorscore", :version=>"0.0.5"}]
		@check.vuln?.should   == false
	end
end
