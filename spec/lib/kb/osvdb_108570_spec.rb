require 'spec_helper'
describe "The OSVDB-108570 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_108570.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (3.0.23)" do
    @check.dependencies = [{:name=>"backup_checksum", :version=>"3.0.23"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (0.4.15)" do
    @check.dependencies = [{:name=>"backup_checksum", :version=>"3.0.24"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "must be filled with CVE identifier"
  it "must be filled with CVSS information"
end
