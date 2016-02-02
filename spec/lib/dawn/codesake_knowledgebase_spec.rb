require 'spec_helper'

describe "The Codesake Dawn knowledge base" do
  let (:kb) {Dawn::KnowledgeBase.new}
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
    sc.class.should == Dawn::Kb::CVE_2013_1855
  end 


  it "must have test for CVE_2013_0333" do 
    sc = kb.find("CVE-2013-0333")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0333
  end

  it "must have test for CVE_2013_1857" do
    sc = kb.find("CVE-2013-1857")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1857
  end

  it "must have test for CVE_2012_2660" do
    sc = kb.find("CVE-2012-2660")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2660
  end
  it "must have test for CVE_2012_2661" do
    sc = kb.find("CVE-2012-2661")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2661
  end
  it "must have test for CVE_2012_2694" do
    sc = kb.find("CVE-2012-2694")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2694
  end
  it "must have test for CVE_2012_2695" do
    sc = kb.find("CVE-2012-2695")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2695
  end
  it "must have test for CVE_2012_6496" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6496
  end
  it "must have test for CVE_2012_6497" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6496
  end

  it "must have test for CVE_2013_0269" do
    sc = kb.find("CVE-2013-0269")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0269
  end

  it "must have test for CVE_2013_0155" do
    sc = kb.find("CVE-2013-0155")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0155
  end
  it "must have test for CVE_2011_2931" do
    sc = kb.find("CVE-2011-2931")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2931
  end
  it "must have test for CVE_2012_3465" do
    sc = kb.find("CVE-2012-3465")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_3465
  end

  it "must have test for CVE_2013_1854" do
    sc = kb.find("CVE-2013-1854")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1854
  end

  it "must have test for CVE_2013_1856" do
    sc = kb.find("CVE-2013-1856")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1856
  end

  it "must have test for CVE_2013_0276" do
    sc = kb.find("CVE-2013-0276")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0276
  end

  it "must have test for CVE_2013_0277" do
    sc = kb.find("CVE-2013-0277")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0277
  end

  it "must have test for CVE_2013_0156" do
    sc = kb.find("CVE-2013-0156")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0156
  end

  it "must have test for CVE-2013-2615" do
    sc = kb.find("CVE-2013-2615")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2615
  end

  it "must have test for CVE-2013-1875" do
    sc = kb.find("CVE-2013-1875")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1875
  end

  it "must have test for CVE-2013-1655" do
    sc = kb.find("CVE-2013-1655")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1655
  end
  it "must have test for CVE-2013-1656" do
    sc = kb.find("CVE-2013-1656")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1656
  end

  it "must have test for CVE-2013-0175" do
    sc = kb.find("CVE-2013-0175")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0175
  end
  it "must have test for CVE-2013-0233" do
    sc = kb.find("CVE-2013-0233")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0233
  end
  it "must have test for CVE-2013-0284" do
    sc = kb.find("CVE-2013-0284")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0284
  end
  it "must have test for CVE-2013-0285" do
    sc = kb.find("CVE-2013-0285")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0285
  end
  it "must have test for CVE-2013-1801" do
    sc = kb.find("CVE-2013-1801")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1801
  end
  it "must have test for CVE-2013-1802" do
    sc = kb.find("CVE-2013-1802")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1802
  end
  it "must have test for CVE-2013-1821" do
    sc = kb.find("CVE-2013-1821")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1821
  end
  it "must have test for CVE-2013-1898" do
    sc = kb.find("CVE-2013-1898")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1898
  end
  it "must have test for CVE-2013-1911" do
    sc = kb.find("CVE-2013-1911")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1911
  end
  it "must have test for CVE-2013-1933" do
    sc = kb.find("CVE-2013-1933")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1933
  end
  it "must have test for CVE-2013-1947" do
    sc = kb.find("CVE-2013-1947")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1947
  end
  it "must have test for CVE-2013-1948" do
    sc = kb.find("CVE-2013-1948")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1948
  end
  it "must have test for CVE-2013-2616" do
    sc = kb.find("CVE-2013-2616")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2616
  end
  it "must have test for CVE-2013-2617" do
    sc = kb.find("CVE-2013-2617")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2617
  end
  it "must have test for CVE-2013-3221" do
    sc = kb.find("CVE-2013-3221")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_3221
  end

  it "must have test for CVE-2011-0447" do
    sc = kb.find("CVE-2011-0447")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_0447
  end

  it "must have test for CVE-2011-3186" do
    sc = kb.find("CVE-2011-3186")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_3186
  end
  it "must have test for CVE-2012-1099" do
    sc = kb.find("CVE-2012-1099")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_1099
  end
  it "must have test for CVE-2012-1241" do
    sc = kb.find("CVE-2012-1241")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_1241
  end
  it "must have test for CVE-2012-2140" do
    sc = kb.find("CVE-2012-2140")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2140
  end
  it "must have test for CVE-2012-5370" do
    sc = kb.find("CVE-2012-5370")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_5370
  end
  it "must have test for CVE-2012-5371" do
    sc = kb.find("CVE-2012-5371")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_5371
  end
  it "must have test for CVE-2011-2197" do
    sc = kb.find("CVE-2011-2197")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2197
  end
  it "must have test for CVE-2011-2932" do
    sc = kb.find("CVE-2011-2932")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2932
  end
  it "must have test for CVE-2012-3463" do
    sc = kb.find("CVE-2012-3463")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_3463
  end
  it "must have test for CVE-2012-3464" do
    sc = kb.find("CVE-2012-3464")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_3464
  end
  it "must have test for CVE-2012-4464" do
    sc = kb.find("CVE-2012-4464")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_4464
  end
  it "must have test for CVE-2012-4466" do
    sc = kb.find("CVE-2012-4466")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_4466
  end
  it "must have test for CVE-2012-4481" do
    sc = kb.find("CVE-2012-4481")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_4481
  end
  it "must have test for CVE-2012-6134" do
    sc = kb.find("CVE-2012-6134")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6134
  end
  it "must have test for CVE-2012-6496" do
    sc = kb.find("CVE-2012-6496")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6496
  end

  it "must have test for CVE-2012-6497" do
    sc = kb.find("CVE-2012-6497")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6497
  end

  it "must have test for CVE-2010-1330" do
    sc = kb.find("CVE-2010-1330")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2010_1330
  end

  it "must have test for CVE-2011-0446" do
    sc = kb.find("CVE-2011-0446")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_0446
  end

  it "must have test for CVE-2011-0995" do
    sc = kb.find("CVE-2011-0995")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_0995
  end

  it "must have test for CVE-2011-2929" do
    sc = kb.find("CVE-2011-2929")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2929
  end

  it "must have test for CVE-2011-4815" do
    sc = kb.find("CVE-2011-4815")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_4815
  end

  it "must have test for CVE-2012-3424" do
    sc = kb.find("CVE-2012-3424")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_3424
  end

  it "must have test for CVE-2012-5380" do
    sc = kb.find("CVE-2012-5380")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_5380
  end

  it "must have test for CVE-2012-4522" do
    sc = kb.find("CVE-2012-4522")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_4522
  end
  it "must have test for CVE-2013-2065" do
    sc = kb.find("CVE-2013-2065")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2065
  end
  it "must have test for CVE-2013-4389" do
    sc = kb.find("CVE-2013-4389")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4389
  end

  it "must have test for CVE-2013-4164" do
    sc = kb.find("CVE-2013-4164")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4164
  end

  it "must have test for CVE-2013-4562" do
    sc = kb.find("CVE-2013-4562")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4562
  end
  it "must have test for CVE-2013-4457" do
    sc = kb.find("CVE-2013-4457")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4457
  end

  it "must have test for 20131129-SimpleForm-Xss" do
    sc = kb.find("Simple Form XSS - 20131129")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::SimpleForm_Xss_20131129
  end

  it "must have test for CVE-2013-4491" do
    sc = kb.find("CVE-2013-4491")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4491
  end

  it "must have test for CVE-2013-4492" do
    sc = kb.find("CVE-2013-4492")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4492
  end
  it "must have test for CVE-2013-6414" do
    sc = kb.find("CVE-2013-6414")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6414
  end
  it "must have test for CVE-2013-6415" do
    sc = kb.find("CVE-2013-6415")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6415
  end
  it "must have test for CVE-2013-6416" do
    sc = kb.find("CVE-2013-6416")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6416
  end

  it "must have test for CVE-2013-6417" do
    sc = kb.find("CVE-2013-6417")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6417
  end

  it "must have test for CVE-2013-6460" do
    sc = kb.find("CVE-2013-6460")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6460
  end
  it "must have test for CVE-2013-6461" do
    sc = kb.find("CVE-2013-6461")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6461
  end
  it "must have test for CVE-2013-4478" do
    sc = kb.find("CVE-2013-4478")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4478
  end
  it "must have test for CVE-2013-4479" do
    sc = kb.find("CVE-2013-4479")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4479
  end
  it "must have test for CVE-2013-1812" do
    sc = kb.find("CVE-2013-1812")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1812
  end
  it "must have test for CVE-2013-6421" do
    sc = kb.find("CVE-2013-6421")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6421
  end

  it "must have test for CVE-2004-0755" do
    sc = kb.find("CVE-2004-0755")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2004_0755
  end
  it "must have test for CVE-2004-0983" do
    sc = kb.find("CVE-2004-0983")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2004_0983
  end  
  it "must have test for CVE-2005-1992" do
    sc = kb.find("CVE-2005-1992")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2005_1992
  end
  it "must have test for CVE-2005-2337" do
    sc = kb.find("CVE-2005-2337")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2005_2337
  end
  it "must have test for CVE-2006-1931" do
    sc = kb.find("CVE-2006-1931")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_1931
  end
  it "must have test for CVE-2006-2582" do
    sc = kb.find("CVE-2006-2582")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_2582
  end
  it "must have test for CVE-2006-3694" do
    sc = kb.find("CVE-2006-3694")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_3694
  end

  it "must have test for CVE-2006-4112" do
    sc = kb.find("CVE-2006-4112")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_4112
  end

  it "must have test for CVE-2006-5467" do
    sc = kb.find("CVE-2006-5467")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_5467
  end

  it "must have test for CVE-2006-6303" do
    sc = kb.find("CVE-2006-6303")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_6303
  end
  it "must have test for CVE-2006-6852" do
    sc = kb.find("CVE-2006-6852")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_6852
  end
  it "must have test for CVE-2006-6979" do
    sc = kb.find("CVE-2006-6979")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2006_6979
  end
  it "must have test for CVE-2007-0469" do
    sc = kb.find("CVE-2007-0469")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_0469
  end
  it "must have test for CVE-2013-2090" do
    sc = kb.find("CVE-2013-2090")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2090
  end
  it "must have test for CVE-2011-4319" do
    sc = kb.find("CVE-2011-4319")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_4319
  end
  it "must have test for CVE-2011-3187" do
    sc = kb.find("CVE-2011-3187")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_3187
  end
  it "must have test for CVE-2011-3009" do
    sc = kb.find("CVE-2011-3009")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_3009
  end

  it "must have test for CVE-2011-2930" do
    sc = kb.find("CVE-2011-2930")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2930
  end

  it "must have test for CVE-2011-2705" do
    sc = kb.find("CVE-2011-2705")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2705
  end
  it "must have test for CVE-2011-2686" do
    sc = kb.find("CVE-2011-2686")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_2686
  end
  it "must have test for CVE-2011-1005" do
    sc = kb.find("CVE-2011-1005")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_1005
  end
  it "must have test for CVE-2011-1004" do
    sc = kb.find("CVE-2011-1004")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_1004
  end
  it "must have test for CVE-2011-0739" do
    sc = kb.find("CVE-2011-0739")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_0739
  end
  it "must have test for CVE-2011-0188" do
    sc = kb.find("CVE-2011-0188")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_0188
  end
  it "must have test for CVE-2010-3933" do
    sc = kb.find("CVE-2010-3933")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2010_3933
  end
  it "must have test for CVE-2010-2489" do
    sc = kb.find("CVE-2010-2489")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2010_2489
  end
  it "must have test for CVE-2009-4214" do
    sc = kb.find("CVE-2009-4214")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2009_4214
  end
  it "must have test for CVE-2009-4124" do
    sc = kb.find("CVE-2009-4124")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2009_4124
  end
  it "must have test for CVE-2009-4078" do
    sc = kb.find("CVE-2009-4078")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2009_4078
  end
  it "must have test for CVE-2008-7248" do
    sc = kb.find("CVE-2008-7248")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_7248
  end
  it "must have test for CVE-2008-5189" do
    sc = kb.find("CVE-2008-5189")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_5189
  end
  it "must have test for CVE-2008-4310" do
    sc = kb.find("CVE-2008-4310")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_4310
  end
  it "must have test for CVE-2008-4094" do
    sc = kb.find("CVE-2008-4094")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_4094
  end
  it "must have test for CVE-2008-3905" do
    sc = kb.find("CVE-2008-3905")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_3905
  end
  it "must have test for CVE-2008-3790" do
    sc = kb.find("CVE-2008-3790")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_3790
  end
  it "must have test for CVE-2008-3657" do
    sc = kb.find("CVE-2008-3657")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_3657
  end
  it "must have test for CVE-2008-3655" do
    sc = kb.find("CVE-2008-3655")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_3655
  end
  it "must have test for CVE-2008-2725" do
    sc = kb.find("CVE-2008-2725")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_2725
  end
  it "must have test for CVE-2008-2663" do
    sc = kb.find("CVE-2008-2663")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_2663
  end
  it "must have test for CVE-2008-2664" do
    sc = kb.find("CVE-2008-2664")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_2664
  end
  it "must have test for CVE-2008-2662" do
    sc = kb.find("CVE-2008-2662")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_2662
  end
  it "must have test for CVE-2008-2376" do
    sc = kb.find("CVE-2008-2376")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_2376
  end
  it "must have test for CVE-2008-1891" do
    sc = kb.find("CVE-2008-1891")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_1891
  end
  it "must have test for CVE-2008-1145" do
    sc = kb.find("CVE-2008-1145")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2008_1145
  end
  it "must have test for CVE-2007-6612" do
    sc = kb.find("CVE-2007-6612")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_6612
  end
  it "must have test for CVE-2007-6077" do
    sc = kb.find("CVE-2007-6077")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_6077
  end
  it "must have test for CVE-2007-5770" do
    sc = kb.find("CVE-2007-5770")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_5770
  end
  it "must have test for CVE-2007-5380" do
    sc = kb.find("CVE-2007-5380")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_5380
  end
  it "must have test for CVE-2007-5379" do
    sc = kb.find("CVE-2007-5379")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_5379
  end
  it "must have test for CVE-2007-5162" do
    sc = kb.find("CVE-2007-5162")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2007_5162
  end
  it "must have test for CVE-2013-2119" do
    sc = kb.find("CVE-2013-2119")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2119
  end
  it "must have test for CVE-2013-7086" do
    sc = kb.find("CVE-2013-7086")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_7086
  end
  it "must have test for CVE-2013-6459" do
    sc = kb.find("CVE-2013-6459")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_6459
  end
  it "must have test for CVE-2013-5647" do
    sc = kb.find("CVE-2013-5647")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_5647
  end
  it "must have test for CVE-2013-0263" do
    sc = kb.find("CVE-2013-0263")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0263
  end
  it "must have test for CVE-2013-0256" do
    sc = kb.find("CVE-2013-0256")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0256
  end
  it "must have test for CVE-2013-0162" do
    sc = kb.find("CVE-2013-0162")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0162
  end
  it "must have test for CVE-2012-2671" do
    sc = kb.find("CVE-2012-2671")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2671
  end
  it "must have test for CVE-2012-2139" do
    sc = kb.find("CVE-2012-2139")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_2139
  end
  it "must have test for CVE-2012-1098" do
    sc = kb.find("CVE-2012-1098")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_1098
  end
  it "must have test for CVE-2013-1756" do
    sc = kb.find("CVE-2013-1756")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1756
  end
  it "must have test for CVE-2014-1233" do
    sc = kb.find("CVE-2014-1233")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_1233
  end
  it "must have test for CVE-2014-1234" do
    sc = kb.find("CVE-2014-1234")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_1234
  end
  it "must have test for CVE-2013-4413" do
    sc = kb.find("CVE-2013-4413")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4413
  end

  it "must have test for CVE-2013-4489" do
    sc = kb.find("CVE-2013-4489")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4489
  end
  it "must have test for CVE-2013-5671" do
    sc = kb.find("CVE-2013-5671")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_5671
  end
  it "must have test for CVE-2013-4593" do
    sc = kb.find("CVE-2013-4593")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4593
  end
  it "must have test for CVE-2013-0262" do
    sc = kb.find("CVE-2013-0262")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0262
  end
  it "must have test for CVE-2013-0184" do
    sc = kb.find("CVE-2013-0184")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0184
  end
  it "must have test for CVE-2013-0183" do
    sc = kb.find("CVE-2013-0183")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_0183
  end
  it "must have test for CVE-2012-6109" do
    sc = kb.find("CVE-2012-6109")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6109
  end
  it "must have test for CVE-2011-5036" do
    sc = kb.find("CVE-2011-5036")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2011_5036
  end
  it "must have test for CVE-2013-2516" do
    sc = kb.find("CVE-2013-2516")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2516
  end
  it "must have test for CVE-2013-2513" do
    sc = kb.find("CVE-2013-2513")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2513
  end
  it "must have test for CVE-2013-2512" do
    sc = kb.find("CVE-2013-2512")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2512
  end
  it "must have test for CVE-2013-1607" do
    sc = kb.find("CVE-2013-1607")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_1607
  end
  it "must have test for CVE-2014-0080" do
    sc = kb.find("CVE-2014-0080")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_0080

  end

  it "must have test for CVE-2014-0081" do
    sc = kb.find("CVE-2014-0081")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_0081
  end
  it "must have test for CVE-2014-0082" do
    sc = kb.find("CVE-2014-0082")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_0082
  end
  it "must have test for CVE-2014-2322" do
    sc = kb.find("CVE-2014-2322")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_2322
  end

  it "must have test for CVE-2014-0036" do
    sc = kb.find("CVE-2014-0036")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_0036
  end
  it "must have test for CVE-2014-2538" do
    sc = kb.find("CVE-2014-2538")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_2538
  end
  it "must have test for CVE-2013-4203" do
    sc = kb.find("CVE-2013-4203")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_4203
  end
  it "must have test for CVE-2014-2525" do
    sc = kb.find("CVE-2014-2525")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_2525
  end
  it "must have test for OSVDB_105971" do
    sc = kb.find("OSVDB-105971")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_105971
  end

  it "must have test for CVE-2014-0130" do
    sc = kb.find("CVE-2014-0130")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_0130
  end
  it "must have test for CVE-2013-2105" do
    sc = kb.find("CVE-2013-2105")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2013_2105
  end
  it "must have test for OSVDB-108569" do
    sc = kb.find("OSVDB-108569")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_108569
  end

  it "must have test for OSVDB-108570" do
    sc = kb.find("OSVDB-108570")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_108570
  end

  it "must have test for OSVDB-108530" do
    sc = kb.find("OSVDB-108530")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_108530
  end
  it "must have test for OSVDB-108563" do
    sc = kb.find("OSVDB-108563")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_108563
  end

  it "must have test for CVE-2014-3482" do
    sc = kb.find("CVE-2014-3482")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_3482
  end

  it "must have test for CVE-2014-3483" do
    sc = kb.find("CVE-2014-3483")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_3483
  end
  it "must have test for OSVDB_119927" do
    sc = kb.find("OSVDB_119927")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_119927
  end
  it "must have test for OSVDB_119878" do
    sc = kb.find("OSVDB_119878")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_119878
  end
  it "must have test for OSVDB_118954" do
    sc = kb.find("OSVDB_118954")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_118954
  end
  it "must have test for OSVDB_118579" do
    sc = kb.find("OSVDB_118579")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_118579
  end
  it "must have test for OSVDB_118830" do
    sc = kb.find("OSVDB_118830")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_118830
  end
  it "must have test for CVE-2015-3224" do
    sc = kb.find("CVE-2015-3224")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_3224
  end
  it "must have test for CVE-2015-3225" do
    sc = kb.find("CVE-2015-3225")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_3225
  end
  it "must have test for CVE-2015-3227" do
    sc = kb.find("CVE-2015-3227")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_3227
  end
  it "must have test for CVE-2015-3226" do
    sc = kb.find("CVE-2015-3226")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_3226
  end
  it "must have test for CVE-2015-2963" do
    sc = kb.find("CVE-2015-2963")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_2963
  end
  it "CVE-2015-1840 can't be tested. Trust me. It works"
  it "must have test for CVE-2015-3448" do
    sc = kb.find("CVE-2015-3448")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_3448
  end
  it "must have test for CVE-2014-9490" do
    sc = kb.find("CVE-2014-9490")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_9490
  end
  it "must have test for CVE-2012-6684" do
    sc = kb.find("CVE-2012-6684")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2012_6684
  end
  it "must have test for CVE-2014-8090" do
    sc = kb.find("CVE-2014-8090")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_8090
  end
  it "must have test for CVE-2014-7829" do
    sc = kb.find("CVE-2014-7829")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_7829
  end
  it "must have test for CVE-2014-3916" do
    sc = kb.find("CVE-2014-3916")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_3916
  end
  it "not sure if it must have check for CVE-2014-3248. Too much gem involved in a single CVE only with ruby 1.9.1 and with social engineering required"
  it "must have test for CVE-2014-4975" do
    sc = kb.find("CVE-2014-4975")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_4975
  end
  it "must have test for CVE-2014-7819" do
    sc = kb.find("CVE-2014-7819")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_7819
  end
  it "must have test for CVE-2014-7818" do
    sc = kb.find("CVE-2014-7818")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2014_7818
  end
  it "must have test for OSVDB_120415" do
    sc = kb.find("OSVDB_120415")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_120415
  end
  it "must have test for OSVDB_120857" do
    sc = kb.find("OSVDB_120857")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_120857
  end
  it "must have test for OSVDB_121701" do
    sc = kb.find("OSVDB_121701")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_121701
  end
  it "must have test for CVE-2015-4020" do
    sc = kb.find("CVE-2015-4020")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_4020
  end
  it "must have test for OSVDB_117903" do
    sc = kb.find("OSVDB_117903")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_117903
  end
  it "must have test for OSVDB_115654" do
    sc = kb.find("OSVDB_115654")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_115654
  end
  it "must have test for OSVDB_116010" do
    sc = kb.find("OSVDB_116010")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::OSVDB_116010
  end
  it "must have test for CVE-2015-1819" do
    sc = kb.find("CVE-2015-1819")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_1819
  end
  it "must have test for CVE-2015-7576" do
    sc = kb.find("CVE-2015-7576")
    sc.should_not   be_nil
    sc.class.should == Dawn::Kb::CVE_2015_7576
  end
  it "must have test for CVE-2016-0751" do
  sc = kb.find("CVE-2016-0751")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2016_0751
end
  it "must have test for CVE-2015-7577" do
  sc = kb.find("CVE-2015-7577")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7577
end
it "must have test for CVE-2015-7579" do
  sc = kb.find("CVE-2015-7579")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7579
end
it "must have test for CVE-2016-0752" do
  sc = kb.find("CVE-2016-0752")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2016_0752
end
it "must have test for CVE-2016-0753" do
  sc = kb.find("CVE-2016-0753")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2016_0753
end
it "must have test for CVE-2015-7578" do
  sc = kb.find("CVE-2015-7578")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7578
end
it "must have test for CVE-2015-7581" do
  sc = kb.find("CVE-2015-7581")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7581
end
it "must have test for CVE-2015-5312" do
  sc = kb.find("CVE-2015-5312")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_5312
end
it "must have test for CVE-2015-7497" do
  sc = kb.find("CVE-2015-7497")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7497
end
it "must have test for CVE-2015-7498" do
  sc = kb.find("CVE-2015-7498")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7498
end
it "must have test for CVE-2015-7499" do
  sc = kb.find("CVE-2015-7499")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7499
end
it "must have test for CVE-2015-7500" do
  sc = kb.find("CVE-2015-7500")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7500
end
it "must have test for CVE-2015-8241" do
  sc = kb.find("CVE-2015-8241")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_8241
end
it "must have test for CVE-2015-8242" do
  sc = kb.find("CVE-2015-8242")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_8242
end
it "must have test for CVE-2015-8317" do
  sc = kb.find("CVE-2015-8317")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_8317
end
it "must have test for CVE-2015-7541" do
  sc = kb.find("CVE-2015-7541")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7541
end
it "must have test for CVE-2015-7519" do
  sc = kb.find("CVE-2015-7519")
  sc.should_not   be_nil
  sc.class.should == Dawn::Kb::CVE_2015_7519
end
end
