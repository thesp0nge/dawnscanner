require 'spec_helper'
describe "The CVE-2014-9490 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_9490.new
		# @check.debug = true
	end

  it "is reported when vulnerable raven-ruby gem is used (0.12.1)" do
    @check.dependencies = [{:name=>"raven-ruby", :version=>'0.12.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when safe raven-ruby gem is used (0.12.2)" do
    @check.dependencies = [{:name=>"raven-ruby", :version=>'0.12.2'}]
    expect(@check.vuln?).to   eq(false)
  end

end
