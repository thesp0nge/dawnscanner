require 'spec_helper'
describe "The CVE-2013-2516 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2516.new
		# @check.debug = true
	end
  it "is reported when a fileutils gem version 0.7 is detected" do
    @check.dependencies = [{:name=>"fileutils", :version=>"0.7"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a fileutils gem version 0.8 is detected" do
    @check.dependencies = [{:name=>"fileutils", :version=>"0.8"}]
    expect(@check.vuln?).to   eq(false)
  end
end
