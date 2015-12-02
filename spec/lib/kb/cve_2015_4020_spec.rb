require 'spec_helper'
describe "The CVE-2015-4020 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_4020.new
		# @check.debug = true
	end
  it "is reported when the vulnerable rubygem is detected" do
    @check.my_gem_version="2.4.3"
    @check.vuln?.should   == true
  end
  it "is reported when the vulnerable rubygem is detected" do
    @check.my_gem_version="2.2.4"
    @check.vuln?.should   == true
  end
  it "is reported when the vulnerable rubygem is detected" do
    @check.my_gem_version="2.0.16"
    @check.vuln?.should   == true
  end
  it "is not reported when a fixed release is detected" do
    @check.my_gem_version="2.4.9"
    @check.vuln?.should   == false
  end

end
