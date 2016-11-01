require 'spec_helper'
describe "The CVE-2014-7829 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_7829.new
		@check.debug = true
	end
  it "is reported when vulnerable rails gem is used (3.2.20)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.20'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (3.1.20)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.1.20'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (3.0.20)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.0.20'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (4.0.11)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.11'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (4.1.7)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.7'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (4.2.0.beta3)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.2.0.beta3'}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is not reported when safe rails gem is used (3.2.21)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.21'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe rails gem is used (4.0.12)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.12'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe rails gem is used (4.1.8)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.8'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe rails gem is used (4.2.0.beta4)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.2.0.beta4'}]
    expect(@check.vuln?).to   eq(false)
  end

	it "is reported when..."
end
