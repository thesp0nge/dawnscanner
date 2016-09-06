require 'spec_helper'
describe "The CVE-2015-7577 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_7577.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0.beta.1"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.5"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.14"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.1.2"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.22"}]
		expect(@check.vuln?).to   eq(true)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"5.0.0.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.5.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.2.6"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.14.2"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"4.1.15"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.0.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.22.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"activerecord", :version=>"3.2.23"}]
		expect(@check.vuln?).to   eq(false)
	end
end
