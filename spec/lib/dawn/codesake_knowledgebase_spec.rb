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

    
  it "will return a nil object if it doesn't find a particular security check"  do
    kb.find("A non existant security check name").should    be_nil
  end

  it "must have at least a test for sinatra" do
    kb.all_by_mvc("sinatra").size.should   > 0
  end

  # KB Content
  it "must have test for CVE_2013_1855" do
    sc = kb.find("CVE-2013-1855")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1855
  end 


  it "must have test for CVE_2013_0333" do 
    sc = kb.find("CVE-2013-0333")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0333
  end

  it "must have test for CVE_2013_1857" do
    sc = kb.find("CVE-2013-1857")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1857
  end

  it "must have test for CVE_2012_2660" do
    sc = kb.find("CVE-2012-2660")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_2660
  end
  it "must have test for CVE_2012_2661" do
    sc = kb.find("CVE-2012-2661")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_2661
  end
  it "must have test for CVE_2012_2694" do
    sc = kb.find("CVE-2012-2694")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_2694
  end
  it "must have test for CVE_2012_2695" do
    sc = kb.find("CVE-2012-2695")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_2695
  end
  it "must have test for CVE_2012_6496" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_6496
  end
  it "must have test for CVE_2012_6497" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_6496
  end

  it "must have test for CVE_2013_0269" do
    sc = kb.find("CVE-2013-0269")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0269
  end

  it "must have test for CVE_2013_0155" do
    sc = kb.find("CVE-2013-0155")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0155
  end
  it "must have test for CVE_2011_2931" do
    sc = kb.find("CVE-2011-2931")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2931
  end
  it "must have test for CVE_2012_3465" do
    sc = kb.find("CVE-2012-3465")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_3465
  end

  it "must have test for CVE_2013_1854" do
    sc = kb.find("CVE-2013-1854")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1854
  end

  it "must have test for CVE_2013_1856" do
    sc = kb.find("CVE-2013-1856")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1856
  end

  it "must have test for CVE_2013_0276" do
    sc = kb.find("CVE-2013-0276")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0276
  end

  it "must have test for CVE_2013_0277"
  it "must have test for CVE_2013_0156"

end
