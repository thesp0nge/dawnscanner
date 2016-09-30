require 'spec_helper'
describe "The CVE-2014-2538 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_2538.new
		# @check.debug = true
	end
  it "is reported when rack-ssl vulnerable version it has been found (1.3.2)" do
    @check.dependencies = [{:name=>'rack-ssl', :version=>'1.3.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when rack-ssl not vulnerable version it has been found (1.3.4)" do
    @check.dependencies = [{:name=>'rack-ssl', :version=>'1.3.4'}]
    expect(@check.vuln?).to   eq(false)
  end
end
