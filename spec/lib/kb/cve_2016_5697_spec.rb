require 'spec_helper'
describe "The CVE-2016-5697 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_5697.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"ruby-saml", :version=>"1.2.9"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"ruby-saml", :version=>"1.3.0"}]
		expect(@check.vuln?).to   eq(false)
	end
end
