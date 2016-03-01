require 'spec_helper'
describe "The OSVDB_120857 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_120857.new
		# @check.debug = true
	end
  it "is reported when the vulnerable gem is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.5.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.5.4"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.4.4"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.3.4"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.2.4"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a fixed release is detected" do
    @check.dependencies = [{:name=>"refile", :version=>"0.1.4"}]
    expect(@check.vuln?).to   eq(false)
  end

end
