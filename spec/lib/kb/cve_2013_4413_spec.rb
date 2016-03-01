require 'spec_helper'
describe "The CVE-2013-4413 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_4413.new
		# @check.debug = true
	end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"wicked", :version=>"1.0.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"wicked", :version=>"1.0.1"}]
    expect(@check.vuln?).to   eq(false)
  end
end
