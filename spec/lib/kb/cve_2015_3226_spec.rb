require 'spec_helper'
describe "The CVE-2015-3226 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2015_3226.new
		# @check.debug = true
	end

  it "is reported when vulnerable active_support gem is used (3.x.x)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'3.2.11'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable active_support gem is used (4.1.11)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.11'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when vulnerable active_support gem is used (4.2.2)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.2.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when safe active_support gem is used (4.1.12)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.12'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe active_support gem is used (4.1.13)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.1.13'}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when safe active_support gem is used (4.2.3)" do
    @check.dependencies = [{:name=>"activesupport", :version=>'4.2.3'}]
    expect(@check.vuln?).to   eq(false)
  end



end
