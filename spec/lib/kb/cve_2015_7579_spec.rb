require 'spec_helper'
describe "The CVE-2015-7579 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7579.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"rails-html-sanitizer", :version=>"1.0.2"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
		@check.dependencies = [{:name=>"", :version=>"1.0.3"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
		@check.dependencies = [{:name=>"", :version=>"1.0.0"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
		@check.dependencies = [{:name=>"", :version=>"1.0.1"}]
		@check.vuln?.should   == false
	end
end
