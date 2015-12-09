require 'spec_helper'
describe "The OSVDB_115654 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_115654.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"raven-ruby", :version=>"0.12.1"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"raven-ruby", :version=>"0.12.2"}]
		@check.vuln?.should   == false
	end
end
