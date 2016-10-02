require 'spec_helper'
describe "The OSVDB_132234 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_132234.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"rack-attack", :version=>"4.3.0"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"rack-attack", :version=>"4.3.1"}]
		expect(@check.vuln?).to   eq(false)
	end
end
