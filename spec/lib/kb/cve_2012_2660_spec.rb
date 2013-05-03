require "spec_helper"
# Automatically created with rake on 2013-05-02

describe "Security check for CVE-2012-2660" do
	let(:check) {Codesake::Dawn::Kb::CVE_2012_2660.new}
	it "knows its name" do
    check.name.should == "CVE-2012-2660"
  end
end
