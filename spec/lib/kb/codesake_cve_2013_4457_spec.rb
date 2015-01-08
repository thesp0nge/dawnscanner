require 'spec_helper'

describe "The CVE-2013-4457 vulnerability" do
  before(:all) do 
    @check = Dawn::Kb::CVE_2013_4457.new
    # @check.debug = true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.0'}]
    @check.vuln?.should   == true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.1'}]
    @check.vuln?.should   == true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.4.2'}]
    @check.vuln?.should   == true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.0'}]
    @check.vuln?.should   == true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.1'}]
    @check.vuln?.should   == true
  end
  it "is detected if vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.5.2'}]
    @check.vuln?.should   == true
  end

  it "is skipped if non vulnerable version of cocaine rubygem is detected" do
    @check.dependencies=[{:name=>"cocaine", :version=>'0.3.2'}]
    # @check.debug = true
    @check.vuln?.should   == false
  end



end
