require 'spec_helper'
describe "The OSVDB_119878 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_119878.new
		# @check.debug = true
	end
  it "is not fixed as the time we're writing this: 4.4.2015"
   # it "is reported when a vulnerable version it has been found (0.7.3)" do
    # @check.dependencies = [{:name=>"rest-client", :version=>"0.7.3"}]
    # @check.vuln?.should   == true
  # end
  # it "is not reported when a safe version it has been found (0.8.0)" do
    # @check.dependencies = [{:name=>"rest-client", :version=>"0.8.0"}]
    # @check.vuln?.should   == false
  # end

end
