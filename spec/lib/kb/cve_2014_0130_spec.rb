require 'spec_helper'
describe "The CVE-2014-0130 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::CVE_2014_0130.new
		# @check.debug = true
	end
  it "is reported when rails 4.1.0 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.0'}]
    @check.vuln?.should   be_true
  end
  it "is reported when rails 4.0.4 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.4'}]
    @check.vuln?.should   be_true
  end
  it "is reported when rails 3.2.17 is detected" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.17'}]
    @check.vuln?.should   be_true
  end
  it "must be filled with CVSS information"
end
