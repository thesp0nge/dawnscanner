require 'spec_helper'
describe "The CVE-2013-2105 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2105.new
		# @check.debug = true
	end
  it "is reported when show_in_browser vulnerable version is reported (0.0.3)" do
    @check.dependencies = [{:name=>'show_in_browser', :version=>'0.0.3'}]
    expect(@check.vuln?).to   eq(true)
  end
end
