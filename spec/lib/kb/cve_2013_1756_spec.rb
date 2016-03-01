require 'spec_helper'
describe "The CVE-2013-1756 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_1756.new
		# @check.debug = true
	end
  it "is reported when dragonfly version 0.9.12 is used" do
    @check.dependencies = [{:name=>"dragonfly", :version=>'0.9.12'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when dragonfly version 0.8.12 is used" do
    @check.dependencies = [{:name=>"dragonfly", :version=>'0.8.12'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when dragonfly version 0.7.12 is used" do
    @check.dependencies = [{:name=>"dragonfly", :version=>'0.7.12'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is not reported when dragonfly version 0.9.13 is used" do
    @check.dependencies = [{:name=>"dragonfly", :version=>'0.9.13'}]
    expect(@check.vuln?).to eq(false)
  end
end
