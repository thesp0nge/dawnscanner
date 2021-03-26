require 'spec_helper'


describe "The security check for gem unsafe dependency should" do
  before(:all) do
    @check =  YAML.load_file("./spec/lib/kb/dependency_check.yml")
    @check.debug=true
    puts @check.vulnerable_version_array
  end

  it "fires if vulnerable 0.5.0 version is detected" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'0.5.0'}]
    expect(@check.vuln?).to    eq(true)
  end
  it "fires if vulnerable 1.3.2 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'1.3.2'}]
    expect(@check.vuln?).to    eq(true)
  end

  it "fires if vulnerable 3.4.0 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'3.4.0'}]
    expect(@check.vuln?).to    eq(true)
  end

  it "doesn't fire if not vulnerable 3.0.0 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'3.0.0'}]
    expect(@check.vuln?).to    eq(false)
  end
end
