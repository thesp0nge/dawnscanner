require 'spec_helper'


describe "The security check for gem unsafe dependency, when versionEndIncluding is set, should" do
  before(:all) do
    f = "./spec/lib/kb/dependency_check_with_version_end_including.yml"
    @check = YAML.load_file(f, permitted_classes: [Dawn::Kb::UnsafeDependencyCheck,
                                                   Dawn::Kb::BasicCheck,
                                                   Dawn::Kb::ComboCheck,
                                                   Dawn::Kb::DependencyCheck,
                                                   Dawn::Kb::DeprecationCheck,
                                                   Dawn::Kb::OperatingSystemCheck,
                                                   Dawn::Kb::PatternMatchCheck,
                                                   Dawn::Kb::RubygemCheck,
                                                   Dawn::Kb::RubyVersionCheck,
                                                   Dawn::Kb::VersionCheck,
                                                   Date,
                                                   Symbol])
    @check.debug=true
  end

  it "fires if vulnerable 0.5.0 version is detected" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'0.5.0'}]
    expect(@check.vuln?).to    eq(true)
  end
  it "fires if vulnerable 1.3.2 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'1.3.2'}]
    expect(@check.vuln?).to    eq(true)
  end

  it "fires if vulnerable 2.7.2.1 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'2.7.2.1'}]
    expect(@check.vuln?).to    eq(true)
  end
  it "fires if vulnerable 2.7.2.2 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'2.7.2.2'}]
    expect(@check.vuln?).to    eq(true)
  end

  it "doesn't fire if not vulnerable 3.0 version is found" do
    @check.dependencies = [{:name=>"acme-gem", :version=>'3.0'}]
    expect(@check.vuln?).to    eq(false)
  end
end
