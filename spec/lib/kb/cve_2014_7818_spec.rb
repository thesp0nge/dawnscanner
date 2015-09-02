require 'spec_helper'
describe "The CVE-2014-7818 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_7818.new
		# @check.debug = true
	end
  it "is reported when vulnerable rails gem is used (3.2.18)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.18'}]
    @check.vuln?.should   == true
  end
  it "is reported when vulnerable rails gem is used (4.0.7)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.7'}]
    @check.vuln?.should   == true
  end
  it "is reported when vulnerable rails gem is used (4.1.6)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.6'}]
    @check.vuln?.should   == true
  end
  it "is reported when vulnerable rails gem is used (4.2.0.beta2)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.2.0.beta2'}]
    @check.vuln?.should   == true
  end

  # SAFE VERSIONS
  it "is not reported when safe rails gem is used (3.2.20)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.20'}]
    @check.vuln?.should   == false
  end
  it "is not reported when safe rails gem is used (4.0.11)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.11'}]
    @check.vuln?.should   == false
  end
  it "is not reported when safe rails gem is used (4.1.7)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.7'}]
    @check.vuln?.should   == false
  end
  it "is not reported when safe rails gem is used (4.2.0.beta3)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.2.0.beta3'}]
    @check.vuln?.should   == false
  end

end
