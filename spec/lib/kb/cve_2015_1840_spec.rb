require 'spec_helper'
describe "The CVE-2015-1840 vulnerability" do
	before(:all) do
		@check_a = Dawn::Kb::CVE_2015_1840_a.new
		@check_b = Dawn::Kb::CVE_2015_1840_b.new
	end
  it "is reported when vulnerable jquery-rails gem is used (3.1.2)" do
    @check_a.dependencies = [{:name=>"jquery-rails", :version=>'3.1.2'}]
    expect(@check_a.vuln?).to   eq(true)
  end
  it "is reported when vulnerable jquery-rails gem is used 4.0.1)" do
    @check_a.dependencies = [{:name=>"jquery-rails", :version=>'4.0.1'}]
    expect(@check_a.vuln?).to   eq(true)
  end
  it "is reported when vulnerable jquery-ujs gem is used 1.0.3)" do
    @check_b.dependencies = [{:name=>"jquery-ujs", :version=>'1.0.3'}]
    expect(@check_b.vuln?).to   eq(true)
  end

  it "is reported when vulnerable jquery-rails gem is used (3.1.3)" do
    @check_a.dependencies = [{:name=>"jquery-rails", :version=>'3.1.3'}]
    expect(@check_a.vuln?).to   eq(false)
  end
  it "is reported when vulnerable jquery-rails gem is used (3.1.4)" do
    @check_a.dependencies = [{:name=>"jquery-rails", :version=>'3.1.4'}]
    expect(@check_a.vuln?).to   eq(false)
  end
  it "is reported when vulnerable jquery-rails gem is used 4.0.2)" do
    @check_a.dependencies = [{:name=>"jquery-rails", :version=>'4.0.2'}]
    expect(@check_a.vuln?).to   eq(false)
  end
  it "is reported when vulnerable jquery-ujs gem is used 1.0.4)" do
    @check_b.dependencies = [{:name=>"jquery-ujs", :version=>'1.0.4'}]
    expect(@check_b.vuln?).to   eq(false)
  end



end
