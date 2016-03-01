require 'spec_helper'
describe "The OSVDB-108563 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_108563.new
		# @check.debug = true
	end

  it "is reported when a vulnerable version it has been found (1.0.0)" do
    @check.dependencies = [{:name=>"gyazo", :version=>"1.0.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (0.4.15)" do
    @check.dependencies = [{:name=>"gyazo", :version=>"1.0.1"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "must be filled with CVE identifier"
  it "must be filled with CVSS information"
end
