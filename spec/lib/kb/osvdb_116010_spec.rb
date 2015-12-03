require 'spec_helper'
describe "The OSVDB_116010 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_116010.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"1.4.0"}]
		@check.vuln?.should   == true
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"1.4.1"}]
		@check.vuln?.should   == false
	end
end
