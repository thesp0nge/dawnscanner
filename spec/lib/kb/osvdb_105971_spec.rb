require 'spec_helper'
describe "The OSVDB_105971 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_105971.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (0.4.14)" do
    @check.dependencies = [{:name=>"sfpagent", :version=>"0.4.14"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (0.4.15)" do
    @check.dependencies = [{:name=>"sfpagent", :version=>"0.4.15"}]
    expect(@check.vuln?).to   eq(false)
  end
end
