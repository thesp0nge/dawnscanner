require 'spec_helper'

describe "A generic static analysis check will" do
  before (:all) do
    options = {:target_version => '2.3.11', :fixes_version => ['2.3.18', '3.2.13', '3.1.12'] } 
    @check = Codesake::Dawn::BasicCheck.new(options)
  end
  it "has a applies? method" do
    @check.should respond_to(:applies?)
  end
  it "has an apply method" 
  it "has a is_vulnerable_version? method" do
    @check.should respond_to(:is_vulnerable_version?)
  end

  it "detects if the MVC framework version is vulnerable" do
    @check.is_vulnerable_version?.should            be_true
    @check.is_vulnerable_version?('2.3.19').should  be_false
    @check.is_vulnerable_version?('3.0.19').should  be_true
    @check.is_vulnerable_version?('3.2.13').should  be_false
    
  end
end
