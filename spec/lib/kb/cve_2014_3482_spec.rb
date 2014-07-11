require 'spec_helper'
describe "The CVE-2014-3482 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::CVE_2014_3482.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (3.2.18)" do
    @check.dependencies = [{:name=>"rails", :version=>"3.2.18"}]
    @check.vuln?.should   be_true
  end
  it "is not reported when a safe version it has been found (3.2.19)" do
    @check.dependencies = [{:name=>"rails", :version=>"3.2.19"}]
    @check.vuln?.should   be_false
  end
end
