require 'spec_helper'

describe "The version check should" do
  before(:all) do
    @check = Codesake::Dawn::Kb::VersionCheck.new
    @check.safe = ['0.4.5', '0.5.4', '0.7.8']
    @check.deprecate = ['0.1.x', '0.2.x', '0.3.x']
    @check.exclude = [ '0.6.4' ]
  end

  it "mark version 0.4.4 as vulnerable" do
    @check.detected = '0.4.4'
    @check.vuln?.should   be_true
  end



end
