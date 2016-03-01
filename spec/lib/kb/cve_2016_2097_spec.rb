require 'spec_helper'
describe "The CVE-2016-2097 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_2097.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.12"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.0.3"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.1.2"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"5.0.0"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.22.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.1.14.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.5.2"}]
		@check.vuln?.should   == false
	end
end
