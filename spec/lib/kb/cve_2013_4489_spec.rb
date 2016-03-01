require 'spec_helper'
describe "The CVE-2013-4489 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_4489.new
		# @check.debug = true
	end

  
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.2"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.3"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.4"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"6.0"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"6.1"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"6.2"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.1"}]
    expect(@check.vuln?).to   eq(false)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.0"}]
    expect(@check.vuln?).to   eq(false)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"3.2"}]
    expect(@check.vuln?).to   eq(false)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"5.4.1"}]
    expect(@check.vuln?).to   eq(false)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"grit", :version=>"6.2.3"}]
    expect(@check.vuln?).to   eq(false)
  end
end
