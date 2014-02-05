require 'spec_helper'
describe "The CVE-2014-1234 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::CVE_2014_1234.new
		# @check.debug = true
	end

  it "is reported when a paratrooper-newrelic gem version 1.0.1 is detected" do
    @check.dependencies = [{:name=>"paratrooper-newrelic", :version=>"1.0.1"}]
    @check.vuln?.should   be_true
  end
  it "is not reported when a paratrooper-newrelic gem version 1.0.2 is detected" do
    @check.dependencies = [{:name=>"paratrooper-newrelic", :version=>"1.0.2"}]
    @check.vuln?.should   be_false
  end
end
