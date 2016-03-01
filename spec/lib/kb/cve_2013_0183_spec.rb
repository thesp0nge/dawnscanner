require 'spec_helper'
describe "The CVE-2013-0183 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2013_0183.new
		# @check.debug = true
	end

  it "is reported when the vulnerable gem is detected - 1.3.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.0"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected - 1.3.1" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.2" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.3" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.4" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.4"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.5" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.5"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.6" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.6"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.3.7" do
    @check.dependencies = [{:name=>"rack", :version=>"1.3.7"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected - 1.4.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.4.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.4.1" do
    @check.dependencies = [{:name=>"rack", :version=>"1.4.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.4.2" do
    @check.dependencies = [{:name=>"rack", :version=>"1.4.2"}]
    expect(@check.vuln?).to   eq(true)
  end
end
