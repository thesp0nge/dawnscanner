require 'spec_helper'
describe "The CVE-2014-2538 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_2538.new
		# @check.debug = true
	end
  it "is reported when rack-ssl vulnerable version it has been found (1.3.9)" do
    @check.dependencies = [{:name=>'rack-ssl', :version=>'1.3.9'}]
    @check.vuln?.should   == true
  end
  it "is reported when rack-ssl not vulnerable version it has been found (1.4.0)" do
    @check.dependencies = [{:name=>'rack-ssl', :version=>'1.4.0'}]
    @check.vuln?.should   == false
  end
end
