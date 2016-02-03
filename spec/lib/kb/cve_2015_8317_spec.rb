require 'spec_helper'
describe "The CVE-2015-8317 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_8317.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.5"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.0"}]
		@check.vuln?.should   == true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.7"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.7.1"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.5.6"}]
		@check.vuln?.should   == false
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.4.6"}]
		@check.vuln?.should   == false
	end
end
