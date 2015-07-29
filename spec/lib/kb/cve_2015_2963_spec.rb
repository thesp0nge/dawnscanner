require 'spec_helper'
describe "The CVE-2015-2963 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_2963.new
		# @check.debug = true
	end
  it "is reported when vulnerable paperclip gem is used 4.2.1)" do
    @check.dependencies = [{:name=>"paperclip", :version=>'4.2.1'}]
    @check.vuln?.should   == true
  end

  it "is reported when not vulnerable paperclip gem is used (4.2.2)" do
    @check.dependencies = [{:name=>"paperclip", :version=>'4.2.2'}]
    @check.vuln?.should   == false
  end

end
