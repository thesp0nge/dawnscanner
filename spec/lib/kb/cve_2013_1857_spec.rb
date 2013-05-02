require "spec_helper"
# Automatically created with rake on 2013-05-02

describe "Security check for CVE-2013-1857" do
	let(:check) {Codesake::Dawn::Kb::CVE_2013_1857.new}
  it "knows its name" do
    check.name.should == "CVE-2013-1857"
  end
  it "checks for sanitize_css pattern" do
    check.attack_pattern.should == ["sanitize"]
  end

end
