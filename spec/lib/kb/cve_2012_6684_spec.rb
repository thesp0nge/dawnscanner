require 'spec_helper'
describe "The CVE-2012-6684 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2012_6684.new
		# @check.debug = true
	end
  it "is reported when vulnerable raven-ruby gem is used (4.2.9)" do
    @check.dependencies = [{:name=>"RedCloth", :version=>'4.2.9'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when safe raven-ruby gem is used (4.2.10)" do
    @check.dependencies = [{:name=>"RedCloth", :version=>'4.2.10'}]
    expect(@check.vuln?).to   eq(false)
  end

end
