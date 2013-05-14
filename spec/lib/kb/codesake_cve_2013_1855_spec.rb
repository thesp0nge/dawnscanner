require 'spec_helper'

describe "Dawn security check for CVE-2013-1855" do
  before(:all) do
    @check = Codesake::Dawn::Kb::CVE_2013_1855.new
  end

  it "knows its name" do
    @check.name.should == "CVE-2013-1855"
  end

  
end
