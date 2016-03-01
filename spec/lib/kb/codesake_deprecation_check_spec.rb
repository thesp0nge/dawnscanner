require "spec_helper"

describe "The deprecation check for Ruby and MVC" do
  before (:all) do
    @check = Dawn::Kb::DeprecationCheck.new
    @check.enable_warning = false
    # @check.debug = true
  end
  ############################################################################
  # Ruby deprecation check
  ############################################################################
  it "should mark a random 1.1.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.1.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.2.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.2.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.3.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.3.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.4.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.4.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.5.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.5.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.6.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.6.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.7.x ruby version as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.7.#{give_a_number}"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark ruby version 1.8.7 as deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.8.7"}
    expect(@check.vuln?).to   eq(true)
  end
  it "should mark a random 1.9.x ruby version as non deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"1.9.#{give_a_number}"}
    expect(@check.vuln?).to   eq(false)
  end
  it "should mark ruby version 2.0.0 as non deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"2.0.0"}
    expect(@check.vuln?).to   eq(false)
  end
  it "should mark ruby version 2.1.0 as non deprecated" do
    @check.detected = {:gem=>"ruby", :version=>"2.1.0"}
    expect(@check.vuln?).to   eq(false)
  end
end
