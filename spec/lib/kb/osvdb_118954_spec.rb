require 'spec_helper'
describe "The OSVDB_118954 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_118954.new
		# @check.debug = true
	end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"rails", :version=>"4.2.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"rails", :version=>"4.2.1.rc3"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"rails", :version=>"4.0.3"}]
    expect(@check.vuln?).to   eq(false)
  end

end
