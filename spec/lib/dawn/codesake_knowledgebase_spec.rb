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

  it "must have test for CVE_2013_0277" do
    sc = kb.find("CVE-2013-0277")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0277
  end

  it "must have test for CVE_2013_0156" do
    sc = kb.find("CVE-2013-0156")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0156
  end

  it "must have test for CVE-2013-2615" do
    sc = kb.find("CVE-2013-2615")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_2615
  end

  it "must have test for CVE-2013-1875" do
    sc = kb.find("CVE-2013-1875")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1875
  end

  it "must have test for CVE-2013-1655" do
    sc = kb.find("CVE-2013-1655")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1655
  end
  it "must have test for CVE-2013-1656" do
    sc = kb.find("CVE-2013-1656")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1656
  end

  it "must have test for CVE-2013-0175" do
    sc = kb.find("CVE-2013-0175")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0175
  end
  it "must have test for CVE-2013-0233" do
    sc = kb.find("CVE-2013-0233")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0233
  end
  it "must have test for CVE-2013-0284" do
    sc = kb.find("CVE-2013-0284")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0284
  end
  it "must have test for CVE-2013-0285" do
    sc = kb.find("CVE-2013-0285")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_0285
  end
  it "must have test for CVE-2013-1801" do
    sc = kb.find("CVE-2013-1801")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1801
  end
  it "must have test for CVE-2013-1802" do
    sc = kb.find("CVE-2013-1802")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1802
  end
  it "must have test for CVE-2013-1821" do
    sc = kb.find("CVE-2013-1821")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1821
  end
  it "must have test for CVE-2013-1898" do
    sc = kb.find("CVE-2013-1898")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1898
  end
  it "must have test for CVE-2013-1911" do
    sc = kb.find("CVE-2013-1911")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1911
  end
  it "must have test for CVE-2013-1933" do
    sc = kb.find("CVE-2013-1933")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1933
  end
  it "must have test for CVE-2013-1947" do
    sc = kb.find("CVE-2013-1947")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1947
  end
  it "must have test for CVE-2013-1948" do
    sc = kb.find("CVE-2013-1948")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1948
  end
  it "must have test for CVE-2013-2616" do
    sc = kb.find("CVE-2013-2616")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_2616
  end
  it "must have test for CVE-2013-2617" do
    sc = kb.find("CVE-2013-2617")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_2617
  end
  it "must have test for CVE-2013-3221" do
    sc = kb.find("CVE-2013-3221")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_3221
  end

  it "must have test for CVE-2011-0447" do
    sc = kb.find("CVE-2011-0447")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_0447
  end

  it "must have test for CVE-2011-3186" do
    sc = kb.find("CVE-2011-3186")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_3186
  end
  it "must have test for CVE-2012-1099" do
    sc = kb.find("CVE-2012-1099")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_1099
  end
  it "must have test for CVE-2012-1241" do
    sc = kb.find("CVE-2012-1241")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_1241
  end
  it "must have test for CVE-2012-2140" do
    sc = kb.find("CVE-2012-2140")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_2140
  end
  it "must have test for CVE-2012-5370" do
    sc = kb.find("CVE-2012-5370")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_5370
  end
  it "must have test for CVE-2012-5371" do
    sc = kb.find("CVE-2012-5371")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_5371
  end
  it "must have test for CVE-2011-2197" do
    sc = kb.find("CVE-2011-2197")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2197
  end
  it "must have test for CVE-2011-2932" do
    sc = kb.find("CVE-2011-2932")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2932
  end
  it "must have test for CVE-2012-3463" do
    sc = kb.find("CVE-2012-3463")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_3463
  end
  it "must have test for CVE-2012-3464" do
    sc = kb.find("CVE-2012-3464")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_3464
  end
  it "must have test for CVE-2012-4464" do
    sc = kb.find("CVE-2012-4464")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_4464
  end
  it "must have test for CVE-2012-4466" do
    sc = kb.find("CVE-2012-4466")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_4466
  end
  it "must have test for CVE-2012-4481" do
    sc = kb.find("CVE-2012-4481")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_4481
  end
  it "must have test for CVE-2012-6134" do
    sc = kb.find("CVE-2012-6134")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_6134
  end
  it "must have test for CVE-2012-6496" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_6496
  end

  it "must have test for CVE-2012-6497" do
    sc = kb.find("CVE-2012-6497")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_6497
  end

  it "must have test for CVE-2010-1330" do
    sc = kb.find("CVE-2010-1330")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2010_1330
  end

  it "must have test for CVE-2011-0446" do
    sc = kb.find("CVE-2011-0446")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_0446
  end

  it "must have test for CVE-2011-0995" do
    sc = kb.find("CVE-2011-0995")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_0995
  end

  it "must have test for CVE-2011-2929" do
    sc = kb.find("CVE-2011-2929")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2929
  end

  it "must have test for CVE-2011-4815" do
    sc = kb.find("CVE-2011-4815")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_4815
  end

  it "must have test for CVE-2012-3424" do
    sc = kb.find("CVE-2012-3424")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_3424
  end

end
