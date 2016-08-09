require 'spec_helper'
describe "The OSVDB_119927 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_119927.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (0.7.3)" do
    @check.dependencies = [{:name=>"http", :version=>"0.7.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (0.8.0)" do
    @check.dependencies = [{:name=>"http", :version=>"0.8.0"}]
    expect(@check.vuln?).to   eq(false)
  end

end
