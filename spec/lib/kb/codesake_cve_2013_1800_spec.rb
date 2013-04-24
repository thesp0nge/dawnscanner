require 'spec_helper'

describe "Security check for CVE-2013-1800" do
  let(:check) { Codesake::Dawn::Kb::CVE_2013_1800.new }

  it "is aware of its name" do
    check.name.should == "CVE-2013-1800"
  end
  it "is a dependency check" do
    check.kind.should == Codesake::Dawn::KnowledgeBase::DEPENDENCY_CHECK
  end
  it "has this CVSS vector \"(AV:N/AC:L/Au:N/C:P/I:P/A:P)\"" do
    check.cvss.should == "AV:N/AC:L/Au:N/C:P/I:P/A:P"
  end
  it "is released 09 April 2013" do
    check.release_date.should == Date.new(2013, 4, 9)
  end
  it "is listed as CWE-264 category" do
    check.cwe.should == "264"
  end

  it "is in the A9 category in the Owasp Top 10 2013" do
    check.owasp.should == "A9"
  end

  it "has a CVE mitre.org link" do
    check.cve_link.should == "http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-1800"
  end

  it "applies for sinatra" do
    check.applies_to?("sinatra").should be_true
  end
  it "applies for padrino" do
    check.applies_to?("padrino").should be_true
  end
  it "applies for rails" do
    check.applies_to?("rails").should be_true
  end
  it "checks if the project depends on crack rubygems and its version is great than 0.3.1" do
    safe_dep = [{:name=>'crack', :version=>'0.3.2'}]
    check.dependencies = safe_dep
    check.vuln?.should    be_false
  end

  it "checks if the project depends on crack rubygems and its version is 0.3.1" do
    vuln_dep = [{:name=>'crack', :version=>'0.3.1'}]
    check.dependencies    = vuln_dep
    check.vuln?.should    be_true
  end

  it "checks if the project depends on crack rubygems and its version is less 0.3.1" do
    vuln_dep = [{:name=>'crack', :version=>'0.2.1'}]
    check.dependencies    = vuln_dep
    check.vuln?.should    be_true
  end
  
  it "has a CVSS score of 7.5" do
    check.cvss_score.should  == 7.5
  end
  it "has a vuln? method" do
    check.should    respond_to(:vuln?)
  end



end
