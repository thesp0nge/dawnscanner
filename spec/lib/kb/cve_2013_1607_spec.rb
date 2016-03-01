require 'spec_helper'
describe "The CVE-2013-1607 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_1607.new
		# @check.debug = true
	end
  it "is reported when a pdfkit gem version 0.5.2 is detected" do
    @check.dependencies = [{:name=>"pdfkit", :version=>"0.5.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a pdfkit gem version 0.5.3 is detected" do
    @check.dependencies = [{:name=>"pdfkit", :version=>"0.5.3"}]
    expect(@check.vuln?).to   eq(false)
  end
end
