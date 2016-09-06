require 'spec_helper'
describe "The CVE-2013-0334 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_0334.new
		# @check.debug = true
	end
  it "is not reported when bundler version 1.7.0 is used" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.7.0'}]
    expect(@check.vuln?).to eq(false)
  end
  it "is not reported when bundler version 1.7.1 is used" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.7.1'}]
    expect(@check.vuln?).to eq(false)
  end
  it "is not reported when bundler version 1.8.7 is used" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.8.7'}]
    expect(@check.vuln?).to eq(false)
  end
  it "is not reported when bundler version 1.10.0.rc is used" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.10.0.rc'}]
    expect(@check.vuln?).to eq(false)
  end
  it "is not reported when bundler version 1.12.5 is used" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.12.5'}]
    expect(@check.vuln?).to eq(false)
  end
  it "fires when vulnerable bundler version it has been found (1.6.6)" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.6.6'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "fires when vulnerable bundler version it has been found (1.3.0)" do
    @check.dependencies = [{:name=>"bundler", :version=>'1.3.0'}]
    expect(@check.vuln?).to   eq(true)
  end
end
