require 'spec_helper'
describe "The CVE-2013-4491 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_4491.new
		# @check.debug = true
	end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"rails", :version=>"3.2.15"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"rails", :version=>"3.2.22"}]
    expect(@check.vuln?).to   eq(false)
  end
end
