require 'spec_helper'
describe "The CVE-2015-3448 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_3448.new
		# @check.debug = true
	end
  it "is reported when vulnerable rest-client gem is used (1.7.2)" do
    @check.dependencies = [{:name=>"rest-client", :version=>'1.7.2'}]
    @check.vuln?.should   == true
  end
  it "is not reported when safe rest-client gem is used (1.7.3)" do
    @check.dependencies = [{:name=>"rest-client", :version=>'1.7.3'}]
    @check.vuln?.should   == false
  end

end
