require 'spec_helper'
describe "The OSVDB_118830 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_118830.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (2.1.1)" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"2.1.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (2.1.2)" do
    @check.dependencies = [{:name=>"doorkeepr", :version=>"2.1.2"}]
    expect(@check.vuln?).to   eq(false)
  end

end
