require 'spec_helper'
describe "The Knowledge base must be converted to YAML" do
  before(:all) do
    @dep_check      = Dawn::Kb::CVE_2013_2513.new
    @combo_check    = Dawn::Kb::CVE_2008_4310.new
    @ruby_ver_check = Dawn::Kb::CVE_2004_0755.new
    @os_check       = Dawn::Kb::CVE_2008_4310.new
    @gem_check      = Dawn::Kb::CVE_2015_4020.new
    @pattern_check  = Dawn::Kb::NotRevisedCode.new
    # @check.debug = true
  end
  it "is reported when a flash_tool gem version 0.6.0 is detected" do
    @check.dependencies = [{:name=>"flash_tool", :version=>"0.6.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a flash_tool gem version 0.6.1 is detected" do
    @check.dependencies = [{:name=>"flash_tool", :version=>"0.6.1"}]
    expect(@check.vuln?).to   eq(false)
  end
end
