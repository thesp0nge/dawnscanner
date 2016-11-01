require 'spec_helper'
describe "The CVE-2016-6582 vulnerability" do
  before(:all) do
    @check = Dawn::Kb::CVE_2016_6582.new
    # @check.debug = true
  end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"1.2.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"2.5.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"3.9.0"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"4.1.0"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"doorkeeper", :version=>"4.2.0"}]
    expect(@check.vuln?).to   eq(false)
  end
end
