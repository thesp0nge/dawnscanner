require 'spec_helper'
describe "The CVE-2015-3224 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_3224.new
		# @check.debug = true
	end
  it "is reported when vulnerable web-console gem is used (2.1.2)" do
    @check.dependencies = [{:name=>"web-console", :version=>'2.1.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when safe rack gem is used (2.1.3)" do
    @check.dependencies = [{:name=>"web-console", :version=>'2.1.3'}]
    expect(@check.vuln?).to   eq(false)
  end

end
