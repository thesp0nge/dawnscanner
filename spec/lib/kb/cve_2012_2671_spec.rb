require 'spec_helper'
describe "The CVE-2012-2671 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2012_2671.new
		# @check.debug = true
	end
  it "is reported when ruby-cache version 0.5 is used" do
    @check.dependencies = [{:name=>"rack-cache", :version=>'0.5'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when ruby-cache version 0.8 is used" do
    @check.dependencies = [{:name=>"rack-cache", :version=>'0.8'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when ruby-cache version 1.1.1 is used" do
    @check.dependencies = [{:name=>"rack-cache", :version=>'1.1.1'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is not reported when ruby-cache version 1.1.2 is used" do
    @check.dependencies = [{:name=>"rack-cache", :version=>'1.1.2'}]
    expect(@check.vuln?).to eq(false)
  end
end
