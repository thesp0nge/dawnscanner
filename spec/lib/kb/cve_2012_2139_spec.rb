require 'spec_helper'
describe "The CVE-2012-2139 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2012_2139.new
		# @check.debug = true
	end
  it "is reported when mail_gem version 2.4.3 is used" do
    @check.dependencies = [{:name=>"mail_gem", :version=>"2.4.3"}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when mail_gem version 2.3.3 is used" do
    @check.dependencies = [{:name=>"mail_gem", :version=>"2.3.3"}]
    expect(@check.vuln?).to eq(true)
  end

  it "is not reported when mail_gem version 2.4.4 is used" do
    @check.dependencies = [{:name=>"mail_gem", :version=>"2.4.4"}]
    expect(@check.vuln?).to eq(false)
  end
end
