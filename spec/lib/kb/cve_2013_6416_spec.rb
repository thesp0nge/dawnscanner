require 'spec_helper'

describe "The CVE-2013-6416 vulnerability" do
  before(:all) do 
    @check = Dawn::Kb::CVE_2013_6416.new
    # @check.debug = true
  end
  it "is detected if vulnerable version of rails rubygem is detected" do
    @check.dependencies=[{:name=>"rails", :version=>'4.0.1'}]
    @check.vuln?.should   == true
  end
  it "is ignored if rails version is 3.2.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.2.16'}]
    @check.vuln?.should   == false
  end

  it "is ignored if rails version is 3.1.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.1.16'}]
    @check.vuln?.should   == false
  end
  it "is ignored if rails version is 3.0.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'3.0.16'}]
    @check.vuln?.should   == false
  end
  it "is ignored if rails version is 2.3.x" do 
    @check.dependencies=[{:name=>"rails", :version=>'2.3.16'}]
    @check.vuln?.should   == false
  end


end
