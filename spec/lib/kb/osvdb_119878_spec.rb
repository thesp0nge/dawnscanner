require 'spec_helper'
describe "The OSVDB_119878 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_119878.new
		# @check.debug = true
	end
  it "is reported when a vulnerable version it has been found (1.6.1.a)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.1.a"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.1"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.2" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.2"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.2.a" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.2.a"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.3)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.3"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.4)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.4"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.5)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.5"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.6)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.6"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.7)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.7"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.8)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.8"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.8.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.8.rc1"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.6.9)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.6.9"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.0.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.0.rc1"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.0)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.0"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.1"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.2)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.2"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.2.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.2.rc1"}]
    @check.vuln?.should   == true
  end
  it "is reported when a vulnerable version it has been found (1.7.3)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.7.3"}]
    @check.vuln?.should   == true
  end
  it "is not reported when a safe version it has been found (1.8.0)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"1.8.0"}]
    @check.vuln?.should   == false
  end
  it "is not reported when a safe version it has been found (2.0.0.rc1)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"2.0.0.rc1"}]
    @check.vuln?.should   == false
  end
  it "is not reported when a safe version it has been found (2.0.0.rc2)" do
    @check.dependencies = [{:name=>"rest-client", :version=>"2.0.0.rc2"}]
    @check.vuln?.should   == false
  end

end
