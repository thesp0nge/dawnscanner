require 'spec_helper'
describe "The CVE-2013-2090 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_2090.new
		# @check.debug = true
	end
  it "fires when vulnerable cremefraiche version is used" do
    @check.dependencies = [{:name=>"cremefraiche", :version=>'0.6.1'}]
    @check.vuln?.should   == true
  end
  it "doesn't fire when not vulnerable cremefraiche version is used" do
    @check.dependencies = [{:name=>"cremefraiche", :version=>'0.6.2'}]
    @check.vuln?.should   == false
  end
end
