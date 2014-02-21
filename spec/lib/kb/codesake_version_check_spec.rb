require 'spec_helper'

describe "The version check should" do
  before(:all) do
    @check = Codesake::Dawn::Kb::VersionCheck.new
    @check.safe=['0.4.5', '0.5.4', '0.7.8']
    @check.deprecated=['0.1.x', '0.2.x', '0.3.x', '1.x']
    @check.excluded=['0.6.4']
    @check.debug = true
  end


  # check for is_vulnerable_xxx?
  it "reports when a version has a vulnerable major" do
    @check.is_vulnerable_major?('2.3.0', '1.2.0').should be_true
  end

  it "reports when a version has a non vulnerable major (equal)" do
    @check.is_vulnerable_major?('2.3.0', '2.2.0').should be_true
  end

  it "reports when a version has a non vulnerable major" do
    @check.is_vulnerable_major?('2.3.0', '3.2.0').should be_false
  end

  it "reports when a version has a vulnerable minor version" do
    @check.is_vulnerable_minor?('2.3.0', '2.2.0').should be_true
  end

  it "reports when a version has a vulnerable minor version (equal)" do
    @check.is_vulnerable_minor?('2.3.0', '2.3.0').should be_true
  end

  it "reports when a version has a non vulnerable minor version" do
    @check.is_vulnerable_minor?('2.3.0', '2.4.0').should be_true
  end

  it "reports when a version is vulnerable" do
    @check.is_vulnerable_version?('2.3.0', '2.2.9').should be_true
  end

  it "reports when a version is not vulnerable (equals)" do
    @check.is_vulnerable_version?('2.3.0', '2.3.0').should be_false
  end

  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.3.0', '2.3.1').should be_false
  end
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.3.0', '2.4.1').should be_false
  end
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.3.0', '4.4.1').should be_false
  end
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.3.0', '4.1.1').should be_false
  end

  # check for x character support
  
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.x', '4.1.1').should be_false
  end
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.x', '4.4.1').should be_false
  end
  it "reports when a version is not vulnerable" do
    @check.is_vulnerable_version?('2.x', '4.4.1').should be_false
  end
  it "reports when a version is vulnerable" do
    @check.is_vulnerable_version?('2.x', '1.4.1').should be_true
  end

  # deprecation check
  it "reports nonsense deprecation" do
    nonsense = Codesake::Dawn::Kb::VersionCheck.new
    nonsense.deprecated = ['x.0.0']
    nonsense.debug = true
    nonsense.is_deprecated?('2.2.3').should be_true
  end

  it "tells 0.1.12 is deprecated" do
    @check.is_deprecated?('0.1.12').should be_true
  end

end
