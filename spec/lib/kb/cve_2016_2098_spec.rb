require 'spec_helper'
describe "The CVE-2016-2098 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_2098.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"3.2.12"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"4.0.3"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"4.1.2"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"4.2.2"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"5.0"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"3.2.22.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"4.1.14.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionpack", :version=>"4.2.5.2"}]
		@check.vuln?.should   == false
	end
end
