require 'spec_helper'
describe "The OSVDB_119878 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_119878.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (1.8.0)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.8.0"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a safe version it has been found (2.0.0.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"2.0.0.rc1"}]
    @check.vuln?.should   == false
  end

end
