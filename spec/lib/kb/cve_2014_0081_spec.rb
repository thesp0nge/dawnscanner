require 'spec_helper'
describe "The CVE-2014-0081 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2014_0081.new
		# @check.debug = true
	end
  it "affects version 3.2.16" do
    @check.dependencies = [{:name=>"rails", :version=>'3.2.16'}]
    expect(@check.vuln?).to eq(true)
  end
  it "affects version 4.0.0" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.0'}]
    expect(@check.vuln?).to eq(true)
  end
  it "affects version 4.0.2" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.2'}]
    expect(@check.vuln?).to eq(true)
  end
  it "affects version 4.0.1" do
    @check.dependencies = [{:name=>"rails", :version=>'4.0.1'}]
    expect(@check.vuln?).to eq(true)
  end

  it "affects version 3.1.x" do
    require 'securerandom'
    rand = SecureRandom.random_number(9999)
    version = "3.1.#{rand}"

    @check.dependencies = [{:name=>"rails", :version=>version}]
    expect(@check.vuln?).to eq(true)
  end
  
  it "affects version 3.0.x" do
    require 'securerandom'
    rand = SecureRandom.random_number(9999)
    version = "3.0.#{rand}"

    @check.dependencies = [{:name=>"rails", :version=>version}]
    expect(@check.vuln?).to eq(true)
  end

  it "doesn't affect version 4.0.3" do 
    @check.dependencies = [{:name=>"rails", :version=>'4.0.3'}]
    expect(@check.vuln?).to eq(false)
  end
  it "doesn't affect version 3.2.22" do 
    @check.dependencies = [{:name=>"rails", :version=>'3.2.22'}]
    expect(@check.vuln?).to eq(false)
  end
end
