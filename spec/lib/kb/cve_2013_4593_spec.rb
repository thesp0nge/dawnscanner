require 'spec_helper'
describe "The CVE-2013-4593 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_4593.new
		# @check.debug = true
	end

  it "is reported when a omniauth-facebook gem version 1.5.0 is detected" do
    @check.dependencies = [{:name=>"omniauth-facebook", :version=>"1.5.0"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a omniauth-facebook gem version 1.5.1 is detected" do
    @check.dependencies = [{:name=>"omniauth-facebook", :version=>"1.5.1"}]
    @check.vuln?.should   == false
  end
end
