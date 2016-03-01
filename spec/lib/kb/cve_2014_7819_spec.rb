require 'spec_helper'
describe "The CVE-2014-7819 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_7819.new
		# @check.debug = true
	end
  # Vulnerable versions
  it "is reported when vulnerable rails gem is used (4.1.7)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.7'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable rails gem is used (3.2.17)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.17'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.0.5)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.0.5'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.1.3)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.1.3'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.2.2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.2.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.3.2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.3.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.4.5)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.4.5'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.5.0)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.5.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.6.0)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.6.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.7.0)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.7.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.8.2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.8.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.9.3)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.9.3'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.10.1)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.10.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.11.2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.11.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (2.12.2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.12.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable sprockets gem is used (3.0.0.beta2)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'3.0.0.beta2'}]
    expect(@check.vuln?).to   eq(true)
  end
  # Safe versions
  it "is not reported when safe rails gem is used (4.1.8)" do
    @check.dependencies = [{:name=>"rails", :version=>'4.1.8'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe rails gem is used (3.2.18)" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.18'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.0.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.0.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.1.4)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.1.4'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.2.3)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.2.3'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.3.3)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.3.3'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.4.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.4.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.5.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.5.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.6.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.6.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.7.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.7.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.8.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.8.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.9.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.9.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.10.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.10.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.11.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.11.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (2.12.6)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'2.12.6'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe sprockets gem is used (3.0.0.beta3)" do
    @check.dependencies = [{:name=>"sprockets", :version=>'3.0.0.beta3'}]
    expect(@check.vuln?).to   eq(false)
  end


end
