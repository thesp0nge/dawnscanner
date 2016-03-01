require 'spec_helper'
describe "The CVE-2013-0162 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_0162.new
		# @check.debug = true
	end
  it "is reported when ruby_parser version 1.x is used" do
    @check.dependencies = [{:name=>"ruby_parser", :version=>'1.4.5'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when ruby_parser version 2.x is used" do
    @check.dependencies = [{:name=>"ruby_parser", :version=>'2.4.5'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is reported when ruby_parser version 3.0.x is used" do
    @check.dependencies = [{:name=>"ruby_parser", :version=>'3.0.5'}]
    expect(@check.vuln?).to eq(true)
  end
  it "is not reported when ruby_parser version 3.1.1 is used" do
    @check.dependencies = [{:name=>"ruby_parser", :version=>'3.1.1'}]
    expect(@check.vuln?).to eq(false)
  end
end
