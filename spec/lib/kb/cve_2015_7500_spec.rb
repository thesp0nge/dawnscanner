require 'spec_helper'
describe "The CVE-2015-7500 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7500.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.5"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.0"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.7"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.7.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.5.6"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.4.6"}]
		expect(@check.vuln?).to   eq(false)
	end
end
