require 'spec_helper'
describe "The CVE-2015-7578 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7578.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"rails-html-sanitizer", :version=>"1.0.2"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"rails-html-sanitizer", :version=>"1.0.3"}]
		@check.vuln?.should   == false
	end
end
