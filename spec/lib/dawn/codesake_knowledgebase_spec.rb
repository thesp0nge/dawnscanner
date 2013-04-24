require 'spec_helper'

describe "The Codesake Dawn knowledge base" do
  let (:kb) {Codesake::Dawn::KnowledgeBase.new}
  it "must not be empty" do
    kb.all.size.should_not  == 0

  end
  it "must have a find method" do
    kb.should   respond_to(:find)
  end

  it "must have an all_by_mvc method" do
    kb.should   respond_to(:all_by_mvc)
  end

  it "will find an existing security check by its name" do
    sc = kb.find("CVE-2013-1855")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1855
  end 
  
  it "will return a nil object if it doesn't find a particular security check"  do
    kb.find("A non existant security check name").should    be_nil
  end

  it "must have at least a test for sinatra" do
    kb.all_by_mvc("sinatra").size.should   > 0
  end

  it "must have test for CVE_2013_0333"
  it "must have test for CVE_2013_0269"
  it "must have test for CVE_2013_1857"
  it "must have test for CVE_2012_2660"
  it "must have test for CVE_2012_2661"
  it "must have test for CVE_2012_2695"
  it "must have test for CVE_2012_5664"
  it "must have test for CVE_2013_0155"
  it "must have test for CVE_2011_2931"
  it "must have test for CVE_2012_3465"


end
