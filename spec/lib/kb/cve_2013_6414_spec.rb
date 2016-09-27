require 'spec_helper'

describe "The CVE-2013-6414 vulnerability" do
  before(:all) do 
    @check = Dawn::Kb::CVE_2013_6414.new
    # @check.debug = true
  end
  it "is detected if vulnerable version of rails rubygem is detected" do
    @check.dependencies=[{:name=>"rails", :version=>'4.0.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is ignored if rails version is 3.2.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.2.22'}]
    expect(@check.vuln?).to   eq(false)
  end

  it "is ignored if rails version is 3.1.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.1.16'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is ignored if rails version is 3.0.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.0.16'}]
    expect(@check.vuln?).to   eq(true)
  end

end
