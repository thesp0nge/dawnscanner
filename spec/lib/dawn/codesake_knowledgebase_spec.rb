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

  it "must have test for CVE-2012-5380" do
    sc = kb.find("CVE-2012-5380")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_5380
  end

  it "must have test for CVE-2012-4522" do
    sc = kb.find("CVE-2012-4522")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2012_4522
  end
  it "must have test for CVE-2013-2065" do
    sc = kb.find("CVE-2013-2065")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_2065
  end
  it "must have test for CVE-2013-4389" do
    sc = kb.find("CVE-2013-4389")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4389
  end

  it "must have test for CVE-2013-4164" do
    sc = kb.find("CVE-2013-4164")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4164
  end

  it "must have test for CVE-2013-4562" do
    sc = kb.find("CVE-2013-4562")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4562
  end
  it "must have test for CVE-2013-4457" do
    sc = kb.find("CVE-2013-4457")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4457
  end

  it "must have test for 20131129-SimpleForm-Xss" do
    sc = kb.find("Simple Form XSS - 20131129")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::SimpleForm_Xss_20131129
  end

  it "must have test for CVE-2013-4491" do
    sc = kb.find("CVE-2013-4491")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4491
  end

  it "must have test for CVE-2013-4492" do
    sc = kb.find("CVE-2013-4492")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4492
  end
  it "must have test for CVE-2013-6414" do
    sc = kb.find("CVE-2013-6414")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_6414
  end
  it "must have test for CVE-2013-6415" do
    sc = kb.find("CVE-2013-6415")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_6415
  end
  it "must have test for CVE-2013-6416" do
    sc = kb.find("CVE-2013-6416")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_6416
  end

  it "must have test for CVE-2013-6417" do
    sc = kb.find("CVE-2013-6417")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_6417
  end

  it "must have test for NokogiriDos20131217_1" do
    sc = kb.find("Nokogiri - Denial of service - 20131217")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::NokogiriDos20131217
  end
  it "must have test for Nokogiri_EntityExpansion_Dos_20131217" do
    sc = kb.find("Nokogiri - Entity expasion denial of service - 20131217")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::Nokogiri_EntityExpansion_Dos_20131217
  end
  it "must have test for CVE-2013-4478" do
    sc = kb.find("CVE-2013-4478")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4478
  end
  it "must have test for CVE-2013-4479" do
    sc = kb.find("CVE-2013-4479")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_4479
  end
  it "must have test for CVE-2013-1812" do
    sc = kb.find("CVE-2013-1812")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_1812
  end
  it "must have test for CVE-2013-6421" do
    sc = kb.find("CVE-2013-6421")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_6421
  end

  it "must have test for CVE-2004-0755" do
    sc = kb.find("CVE-2004-0755")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2004_0755
  end
  it "must have test for CVE-2004-0983" do
    sc = kb.find("CVE-2004-0983")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2004_0983
  end  
  it "must have test for CVE-2005-1992" do
    sc = kb.find("CVE-2005-1992")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2005_1992
  end
  it "must have test for CVE-2005-2337" do
    sc = kb.find("CVE-2005-2337")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2005_2337
  end
  it "must have test for CVE-2006-1931" do
    sc = kb.find("CVE-2006-1931")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_1931
  end
  it "must have test for CVE-2006-2582" do
    sc = kb.find("CVE-2006-2582")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_2582
  end
  it "must have test for CVE-2006-3694" do
    sc = kb.find("CVE-2006-3694")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_3694
  end

  it "must have test for CVE-2006-4112" do
    sc = kb.find("CVE-2006-4112")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_4112
  end

  it "must have test for CVE-2006-5467" do
    sc = kb.find("CVE-2006-5467")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_5467
  end

  it "must have test for CVE-2006-6303" do
    sc = kb.find("CVE-2006-6303")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_6303
  end
  it "must have test for CVE-2006-6852" do
    sc = kb.find("CVE-2006-6852")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_6852
  end
  it "must have test for CVE-2006-6979" do
    sc = kb.find("CVE-2006-6979")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2006_6979
  end
  it "must have test for CVE-2007-0469" do
    sc = kb.find("CVE-2007-0469")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2007_0469
  end
  it "must have test for CVE-2013-2090" do
    sc = kb.find("CVE-2013-2090")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2013_2090
  end
  it "must have test for CVE-2011-4319" do
    sc = kb.find("CVE-2011-4319")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_4319
  end
  it "must have test for CVE-2011-3187" do
    sc = kb.find("CVE-2011-3187")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_3187
  end
  it "must have test for CVE-2011-3009" do
    sc = kb.find("CVE-2011-3009")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_3009
  end

  it "must have test for CVE-2011-2930" do
    sc = kb.find("CVE-2011-2930")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2930
  end

  it "must have test for CVE-2011-2705" do
    sc = kb.find("CVE-2011-2705")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2705
  end
  it "must have test for CVE-2011-2686" do
    sc = kb.find("CVE-2011-2686")
    sc.should_not   be_nil
    sc.class.should == Codesake::Dawn::Kb::CVE_2011_2686
  end
end
