require 'spec_helper'
describe "The CVE-2015-1819 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_1819.new
		# @check.debug = true
	end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.6.3"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"nokogiri", :version=>"1.6.6.4"}]
    @check.vuln?.should   == false
  end

end
