require 'spec_helper'
describe "The CVE-2015-7577 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7577.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0.beta.1"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.5"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.14"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.22"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.5.1"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.6"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.14.2"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.15"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.22.1"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.23"}]
		@check.vuln?.should   == false
	end
end
