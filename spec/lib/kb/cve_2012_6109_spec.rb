require 'spec_helper'
describe "The CVE-2012-6109 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2012_6109.new
		# @check.debug = true
	end
  it "is reported when the vulnerable gem is detected - 1.0.1" do
    @check.dependencies = [{:name=>"rack", :version=>"1.0.1"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected - 0.9.1" do
    @check.dependencies = [{:name=>"rack", :version=>"0.9.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 0.9" do
    @check.dependencies = [{:name=>"rack", :version=>"0.9"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 0.4" do
    @check.dependencies = [{:name=>"rack", :version=>"0.4"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 0.3" do
    @check.dependencies = [{:name=>"rack", :version=>"0.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 0.2" do
    @check.dependencies = [{:name=>"rack", :version=>"0.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 0.1" do
    @check.dependencies = [{:name=>"rack", :version=>"0.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.0.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.0.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.1.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.1.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.1.3" do
    @check.dependencies = [{:name=>"rack", :version=>"1.1.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.1.2" do
    @check.dependencies = [{:name=>"rack", :version=>"1.1.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.2.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.2.0"}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is reported when the vulnerable gem is detected - 1.2.1" do
    @check.dependencies = [{:name=>"rack", :version=>"1.2.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.2.2" do
    @check.dependencies = [{:name=>"rack", :version=>"1.2.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.2.3" do

    @check.dependencies = [{:name=>"rack", :version=>"1.2.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.2.4" do
    @check.dependencies = [{:name=>"rack", :version=>"1.2.4"}]
    expect(@check.vuln?).to   eq(true)
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

  it "is reported when the vulnerable gem is detected - 1.4.0" do
    @check.dependencies = [{:name=>"rack", :version=>"1.4.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when the vulnerable gem is detected - 1.4.1" do
    @check.dependencies = [{:name=>"rack", :version=>"1.4.1"}]
    expect(@check.vuln?).to   eq(true)
  end
end
