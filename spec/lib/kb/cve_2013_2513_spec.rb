require 'spec_helper'
describe "The CVE-2013-2513 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2513.new
		# @check.debug = true
	end
  it "is reported when a flash_tool gem version 0.6.0 is detected" do
    @check.dependencies = [{:name=>"flash_tool", :version=>"0.6.0"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a flash_tool gem version 0.6.1 is detected" do
    @check.dependencies = [{:name=>"flash_tool", :version=>"0.6.1"}]
    @check.vuln?.should   == false
  end
end
