require 'spec_helper'

describe "The CVE-2013-4457 vulnerability" do
  before(:all) do 
    @check = Dawn::Kb::CVE_2013_4457.new
    # @check.debug = true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.2'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.0'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.1'}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.2'}]
    expect(@check.vuln?).to   eq(true)
  end

  it "is skipped if non vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.3.2'}]
    # @check.debug = true
    expect(@check.vuln?).to   eq(false)
  end



end
