require 'spec_helper'
describe "The CVE-2016-6316 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2016_6316.new
		# @check.debug = true
	end
	it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.22.2"}]
		expect(@check.vuln?).to   eq(true)
	end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"5.0.0.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.6"}]
    expect(@check.vuln?).to   eq(true)
  end

	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.0.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"2.2.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"1.2.0"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"3.2.22.3"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"4.2.7.1"}]
		expect(@check.vuln?).to   eq(false)
	end
	it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"actionview", :version=>"5.0.0.1"}]
		expect(@check.vuln?).to   eq(false)
	end
end
