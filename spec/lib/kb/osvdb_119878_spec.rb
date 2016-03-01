require 'spec_helper'
describe "The OSVDB_119878 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_119878.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (1.6.1.a)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.1.a"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.2" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.2.a" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.2.a"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.3)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.4)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.4"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.5)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.5"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.6)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.6"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.7)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.7"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.8)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.8"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.8.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.8.rc1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.6.9)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.9"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.0.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.0.rc1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.0)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.0"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.2)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.2"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.2.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.2.rc1"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is reported when a vulnerable version it has been found (1.7.3)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.3"}]
    expect(@check.vuln?).to   eq(true)
  end
  it "is not reported when a safe version it has been found (1.8.0)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.8.0"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a safe version it has been found (2.0.0.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"2.0.0.rc1"}]
    expect(@check.vuln?).to   eq(false)
  end
  it "is not reported when a safe version it has been found (2.0.0.rc2)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"2.0.0.rc2"}]
    expect(@check.vuln?).to   eq(false)
  end

end
