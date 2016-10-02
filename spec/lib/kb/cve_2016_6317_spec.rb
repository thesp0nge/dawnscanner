require 'spec_helper'
describe "The CVE-2016-6317 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_6317.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.7.0"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.7.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.1.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"2.1.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"1.1.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0"}]
		expect(@check.vuln?).to   eq(false)
	end
end
