require 'spec_helper'
describe "The CVE-2013-5647 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_5647.new
		# @check.debug = true
	end
  it "fires when vulnerable sounder 1.0.1 version is userd" do
    @check.dependencies = [{:name=>"sounder", :version=>'1.0.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "doesn't fire when sounder not vulnerable version is used" do
    @check.dependencies = [{:name=>"sounder", :version=>'1.0.2'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "doesn't fire when a very old sounder version is used" do
    @check.dependencies = [{:name=>"sounder", :version=>'0.9.2'}]
    expect(@check.vuln?).to   eq(false)
  end
end
