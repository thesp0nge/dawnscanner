require 'spec_helper'
describe "The CVE-2015-3227 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_3227.new
		@check.debug = true
	end
  it "is reported when vulnerable active_support gem is used (4.1.11)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.11'}]
    @check.vuln?.should   == true
  end
  it "is reported when vulnerable active_support gem is used (4.2.2)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.2.2'}]
    @check.vuln?.should   == true
  end
  it "is not reported when safe active_support gem is used (4.1.12)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.12'}]
    @check.vuln?.should   == false
  end
  it "is not reported when safe active_support gem is used (4.1.13)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.13'}]
    @check.vuln?.should   == false
  end
  it "is not reported when safe active_support gem is used (4.2.3)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.2.3'}]
    @check.vuln?.should   == false
  end
end
