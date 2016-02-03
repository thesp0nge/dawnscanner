require 'spec_helper'
describe "The CVE-2015-7519 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7519.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"passenger", :version=>"4.0.54"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"passenger", :version=>"5.0.12"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"passenger", :version=>"4.0.60"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"passenger", :version=>"5.0.22"}]
		@check.vuln?.should   == false
	end
end
