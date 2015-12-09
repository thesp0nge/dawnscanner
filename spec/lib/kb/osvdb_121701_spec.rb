require 'spec_helper'
describe "The OSVDB_121701 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_121701.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"open-uri-cached", :version=>"0.0.4"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"open-uri-cached", :version=>"0.0.5"}]
    @check.vuln?.should   == false
  end
end
