require 'spec_helper'
describe "The CVE-2012-1098 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2012_1098.new
		# @check.debug = true
	end
  it "fires when vulnerable rails version it has been found (3.0.11)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.11'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "fires when vulnerable rails version it has been found (3.1.3)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.1.3'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "fires when vulnerable rails version it has been found (3.2.1)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "doesn't fire when non vulnerable rails version it has been found (3.2.2)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.2'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "doesn't fire when non vulnerable rails version it has been found (3.2.4)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.4'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "doesn't fire when non vulnerable rails version it has been found (3.1.4)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.1.4'}]
    # @check.debug = true
    expect(@check.vuln?).to   eq(false)
  end
  it "doesn't fire when rails version older than 3.x.y it has been found" do
    @check.dependencies = [{:name=>"rails", :version=>'2.3.12'}]
    expect(@check.vuln?).to   eq(false)
  end
end
