require 'spec_helper'

describe "The version check should" do
  before(:all) do
    @check = Dawn::Kb::VersionCheck.new
    @check.safe=['0.4.5', '0.5.4', '0.7.8']
    @check.deprecated=['0.1.x', '0.2.x', '0.3.x', '1.x']
    @check.excluded=['0.6.4']
    @check.enable_warning = false
    # @check.debug = true
  end

  context "without some beta versions to handle" do

    it "reports when a version is vulnerable" do
      @check.is_vulnerable_version?('2.3.0', '2.2.9').should == true
    end

    it "reports when a version is not vulnerable (equals)" do
      @check.is_vulnerable_version?('2.3.0', '2.3.0').should == false
    end

    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0', '2.3.1').should == false
    end
    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0', '2.4.1').should == false
    end
    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0', '4.4.1').should == false
    end
    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0', '4.1.1').should == false
    end

    # check for x character support

    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.x', '4.1.1').should == false
    end
    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.x', '4.4.1').should == false
    end
    it "reports when a version is not vulnerable" do
      @check.is_vulnerable_version?('2.x', '4.4.1').should == false
    end
    it "reports when a version is vulnerable" do
      @check.is_vulnerable_version?('2.x', '1.4.1').should == true
    end


  end
  context "with some beta versions to handle" do
    it "reports when a beta version is vulnerable" do
      @check.is_vulnerable_version?('2.3.0.beta3', '2.3.0.beta1').should == true
    end
    it "reports when a beta version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0.beta3', '2.3.0.beta5').should == false
    end
    it "reports when a beta version is not vulnerable (equals)" do
      @check.is_vulnerable_version?('2.3.0.beta5', '2.3.0.beta5').should == false
    end
    it "reports a vulnerability when a stable version is safe and beta is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.3.0.beta9').should == true
    end
    it "reports a safe condition when a beta version is safe and the stable version is detected" do
      @check.is_vulnerable_version?('2.3.0.beta9', '2.3.0').should == false
    end
    it "reports a vulnerability when a previous beta version is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.2.10.beta2').should == true
    end
    it "reports a safe condition when a beta version is detected but the safe version was released earlier (same major, same minor)" do
      @check.is_vulnerable_version?('2.2.0', '2.2.10.beta2').should == false
    end
    it "reports a safe condition when a beta version is detected but the safe version was released earlier (same major)" do
      @check.is_vulnerable_version?('2.2.0', '2.4.10.beta2').should == false
    end
    it "reports a safe condition when a beta version is detected but the safe version was released earlier" do
      @check.is_vulnerable_version?('2.2.0', '3.4.10.beta2').should == false
    end
  end

  context "with some rc versions to handle" do
    it "reports when a rc version is vulnerable" do
      @check.is_vulnerable_version?('2.3.0.rc3', '2.3.0.rc1').should == true
    end
    it "reports when a rc version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0.rc3', '2.3.0.rc5').should == false
    end
    it "reports when a rc version is not vulnerable (equals)" do
      @check.is_vulnerable_version?('2.3.0.rc5', '2.3.0.rc5').should == false
    end
    it "reports a vulnerability when a stable version is safe and rc is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.3.0.rc9').should == true
    end
    it "reports a safe condition when a rc version is safe and the stable version is detected" do
      @check.is_vulnerable_version?('2.3.0.rc9', '2.3.0').should == false
    end
    it "reports a vulnerability when a previous rc version is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.2.10.rc2').should == true
    end
    it "reports a safe condition when a rc version is detected but the safe version was released earlier (same major, same minor)" do
      @check.is_vulnerable_version?('2.2.0', '2.2.10.rc2').should == false
    end
    it "reports a safe condition when a rc version is detected but the safe version was released earlier (same major)" do
      @check.is_vulnerable_version?('2.2.0', '2.4.10.rc2').should == false
    end
    it "reports a safe condition when a rc version is detected but the safe version was released earlier" do
      @check.is_vulnerable_version?('2.2.0', '3.4.10.rc2').should == false
    end
  end

  context "with some pre versions to handle" do
    it "reports when a pre version is vulnerable" do
      @check.is_vulnerable_version?('2.3.0.pre3', '2.3.0.pre1').should == true
    end
    it "reports when a pre version is not vulnerable" do
      @check.is_vulnerable_version?('2.3.0.pre3', '2.3.0.pre5').should == false
    end
    it "reports when a pre version is not vulnerable (equals)" do
      @check.is_vulnerable_version?('2.3.0.pre5', '2.3.0.pre5').should == false
    end
    it "reports a vulnerability when a stable version is safe and pre is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.3.0.pre9').should == true
    end
    it "reports a safe condition when a pre version is safe and the stable version is detected" do
      @check.is_vulnerable_version?('2.3.0.pre9', '2.3.0').should == false
    end
    it "reports a vulnerability when a previous pre version is detected" do
      @check.is_vulnerable_version?('2.3.0', '2.2.10.pre2').should == true
    end
    it "reports a safe condition when a pre version is detected but the safe version was released earlier (same major, same minor)" do
      @check.is_vulnerable_version?('2.2.0', '2.2.10.pre2').should == false
    end
    it "reports a safe condition when a pre version is detected but the safe version was released earlier (same major)" do
      @check.is_vulnerable_version?('2.2.0', '2.4.10.pre2').should == false
    end
    it "reports a safe condition when a pre version is detected but the safe version was released earlier" do
      @check.is_vulnerable_version?('2.2.0', '3.4.10.pre2').should == false
    end
  end
  # deprecation check
  it "reports nonsense deprecation" do
    nonsense = Dawn::Kb::VersionCheck.new
    nonsense.deprecated = ['x.0.0']
    nonsense.is_deprecated?('2.2.3').should == true
  end

  it "tells 1.1.12 is deprecated" do
    @check.is_deprecated?('1.1.12').should == true
  end
  it "tells 0.1.12 is deprecated" do
    @check.is_deprecated?('0.1.12').should == true
  end
  it "tells 0.4.12 is not deprecated" do
    @check.is_deprecated?('0.4.12').should == false
  end
  context "applied as it should be" do
    it "says a version 0.4.6 is safe" do
      @check.detected = '0.4.6'
      @check.save_minor = true
      @check.vuln?.should   == false
    end
  end
end
