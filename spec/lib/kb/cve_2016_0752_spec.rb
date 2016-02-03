require 'spec_helper'
describe "The CVE-2016-0752 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_0752.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"5.0.0.beta.1"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.5"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.1.14"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.22"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"5.0.0"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.5.1"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.6"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.1.14.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.1.15"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.22.1"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.23"}]
		@check.vuln?.should   == false
	end
end
