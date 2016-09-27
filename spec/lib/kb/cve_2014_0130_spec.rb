require 'spec_helper'
describe "The CVE-2014-0130 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_0130.new
		# @check.debug = true
	end
  it "is reported when rails 4.1.0 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when rails 4.0.4 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.4'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when rails 3.2.22 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.22'}]
    expect(@check.vuln?).to   eq(false)
  end
end
