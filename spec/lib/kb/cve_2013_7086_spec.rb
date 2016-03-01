require 'spec_helper'
describe "The CVE-2013-7086 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_7086.new
		# @check.debug = true
	end
	it "is detected for gem 1.0.5.3" do
    @check.dependencies = [{:name=>"webbynode", :version=>'1.0.5.3'}]
    expect(@check.vuln?).to  eq(true)
  end

  it "is detected for gem 1.0.4.3" do
    @check.dependencies = [{:name=>"webbynode", :version=>'1.0.4.3'}]
    expect(@check.vuln?).to  eq(true)
  end

  it "is not detected for gem 1.0.5.4" do
    @check.dependencies = [{:name=>"webbynode", :version=>'1.0.5.4'}]
    expect(@check.vuln?).to  eq(false)
  end

end
