require 'spec_helper'

describe "Dawn security check for CVE-2013-1855" do
  before(:all) do
    @check = Codesake::Dawn::Kb::Cve_2013_1855.new
  end

  it "knows its name" do
    @check.name.should == "CVE-2013-1855"
  end
  it "checks for sanitize_css pattern" do
    @check.attack_pattern.should == "sanitize_css"
  end

  it "won't apply to lorem.txt" do
    @check.load_file("./spec/support/lorem.txt")
    @check.is_vulnerable_version?.should  be_false
  end

end
