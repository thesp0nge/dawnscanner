require 'spec_helper'
describe "The OSVDB_105971 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::OSVDB_105971.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (0.4.14)" do
    @check.dependencies = [{:name=>"sfpagent", :version=>"0.4.14"}]
    @check.vuln?.should   be_true
  end
  it "is not reported when a safe version it has been found (0.4.15)" do
    @check.dependencies = [{:name=>"sfpagent", :version=>"0.4.15"}]
    @check.vuln?.should   be_false
  end
  it "must be filled with CVE identifier"
  it "must be filled with CVSS information"
end
