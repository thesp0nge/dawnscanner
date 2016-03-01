require 'spec_helper'
describe "The CVE-2013-2512 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2512.new
		# @check.debug = true
	end
  it "is reported when a ftpd gem version 0.2.1 is detected" do
    @check.dependencies = [{:name=>"ftpd", :version=>"0.2.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a ftpd gem version 0.2.2 is detected" do
    @check.dependencies = [{:name=>"ftpd", :version=>"0.2.2"}]
    expect(@check.vuln?).to   eq(false)
  end
end
