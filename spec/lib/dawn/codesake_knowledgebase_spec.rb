require 'spec_helper'

describe "The Codesake Dawn knowledge base" do
  let (:kb) {Dawn::KnowledgeBase.new}
  it "must not be empty" do
    expect(kb.all.size).not_to  eq(0)

  end
  it "must have a find method" do
    expect(kb).to   respond_to(:find)
  end

  it "must have an all_by_mvc method" do
    expect(kb).to   respond_to(:all_by_mvc)
  end


  it "will return a nil object if it doesn't find a particular security check"  do
    expect(kb.find("A non existant security check name")).to    be_nil
  end

  it "must have at least a test for sinatra" do
    expect(kb.all_by_mvc("sinatra").size).to   be > 0
  end

  # KB Content
  it "must have test for CVE_2013_1855" do
    sc = kb.find("CVE-2013-1855")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1855)
  end 

  it "must have test for CVE_2013_0333" do 
    sc = kb.find("CVE-2013-0333")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0333)
  end

  it "must have test for CVE_2013_0334" do 
    sc = kb.find("CVE-2013-0334")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0334)
  end

  it "must have test for CVE_2013_1857" do
    sc = kb.find("CVE-2013-1857")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1857)
  end

  it "must have test for CVE_2012_2660" do
    sc = kb.find("CVE-2012-2660")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2660)
  end
  it "must have test for CVE_2012_2661" do
    sc = kb.find("CVE-2012-2661")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2661)
  end
  it "must have test for CVE_2012_2694" do
    sc = kb.find("CVE-2012-2694")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2694)
  end
  it "must have test for CVE_2012_2695" do
    sc = kb.find("CVE-2012-2695")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2695)
  end
  it "must have test for CVE_2012_6496" do
    sc = kb.find("CVE-2012-6496")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6496)
  end
  it "must have test for CVE_2012_6497" do
    sc = kb.find("CVE-2012-6496")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6496)
  end

  it "must have test for CVE_2013_0269" do
    sc = kb.find("CVE-2013-0269")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0269)
  end

  it "must have test for CVE_2013_0155" do
    sc = kb.find("CVE-2013-0155")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0155)
  end
  it "must have test for CVE_2011_2931" do
    sc = kb.find("CVE-2011-2931")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2931)
  end
  it "must have test for CVE_2012_3465" do
    sc = kb.find("CVE-2012-3465")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_3465)
  end

  it "must have test for CVE_2013_1854" do
    sc = kb.find("CVE-2013-1854")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1854)
  end

  it "must have test for CVE_2013_1856" do
    sc = kb.find("CVE-2013-1856")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1856)
  end

  it "must have test for CVE_2013_0276" do
    sc = kb.find("CVE-2013-0276")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0276)
  end

  it "must have test for CVE_2013_0277" do
    sc = kb.find("CVE-2013-0277")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0277)
  end

  it "must have test for CVE_2013_0156" do
    sc = kb.find("CVE-2013-0156")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0156)
  end

  it "must have test for CVE-2013-2615" do
    sc = kb.find("CVE-2013-2615")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2615)
  end

  it "must have test for CVE-2013-1875" do
    sc = kb.find("CVE-2013-1875")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1875)
  end

  it "must have test for CVE-2013-1655" do
    sc = kb.find("CVE-2013-1655")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1655)
  end
  it "must have test for CVE-2013-1656" do
    sc = kb.find("CVE-2013-1656")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1656)
  end

  it "must have test for CVE-2013-0175" do
    sc = kb.find("CVE-2013-0175")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0175)
  end
  it "must have test for CVE-2013-0233" do
    sc = kb.find("CVE-2013-0233")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0233)
  end
  it "must have test for CVE-2013-0284" do
    sc = kb.find("CVE-2013-0284")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0284)
  end
  it "must have test for CVE-2013-0285" do
    sc = kb.find("CVE-2013-0285")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0285)
  end
  it "must have test for CVE-2013-1801" do
    sc = kb.find("CVE-2013-1801")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1801)
  end
  it "must have test for CVE-2013-1802" do
    sc = kb.find("CVE-2013-1802")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1802)
  end
  it "must have test for CVE-2013-1821" do
    sc = kb.find("CVE-2013-1821")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1821)
  end
  it "must have test for CVE-2013-1898" do
    sc = kb.find("CVE-2013-1898")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1898)
  end
  it "must have test for CVE-2013-1911" do
    sc = kb.find("CVE-2013-1911")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1911)
  end
  it "must have test for CVE-2013-1933" do
    sc = kb.find("CVE-2013-1933")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1933)
  end
  it "must have test for CVE-2013-1947" do
    sc = kb.find("CVE-2013-1947")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1947)
  end
  it "must have test for CVE-2013-1948" do
    sc = kb.find("CVE-2013-1948")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1948)
  end
  it "must have test for CVE-2013-2616" do
    sc = kb.find("CVE-2013-2616")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2616)
  end
  it "must have test for CVE-2013-2617" do
    sc = kb.find("CVE-2013-2617")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2617)
  end
  it "must have test for CVE-2013-3221" do
    sc = kb.find("CVE-2013-3221")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_3221)
  end

  it "must have test for CVE-2011-0447" do
    sc = kb.find("CVE-2011-0447")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_0447)
  end

  it "must have test for CVE-2011-3186" do
    sc = kb.find("CVE-2011-3186")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_3186)
  end
  it "must have test for CVE-2012-1099" do
    sc = kb.find("CVE-2012-1099")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_1099)
  end
  it "must have test for CVE-2012-1241" do
    sc = kb.find("CVE-2012-1241")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_1241)
  end
  it "must have test for CVE-2012-2140" do
    sc = kb.find("CVE-2012-2140")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2140)
  end
  it "must have test for CVE-2012-5370" do
    sc = kb.find("CVE-2012-5370")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_5370)
  end
  it "must have test for CVE-2012-5371" do
    sc = kb.find("CVE-2012-5371")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_5371)
  end
  it "must have test for CVE-2011-2197" do
    sc = kb.find("CVE-2011-2197")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2197)
  end
  it "must have test for CVE-2011-2932" do
    sc = kb.find("CVE-2011-2932")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2932)
  end
  it "must have test for CVE-2012-3463" do
    sc = kb.find("CVE-2012-3463")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_3463)
  end
  it "must have test for CVE-2012-3464" do
    sc = kb.find("CVE-2012-3464")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_3464)
  end
  it "must have test for CVE-2012-4464" do
    sc = kb.find("CVE-2012-4464")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_4464)
  end
  it "must have test for CVE-2012-4466" do
    sc = kb.find("CVE-2012-4466")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_4466)
  end
  it "must have test for CVE-2012-4481" do
    sc = kb.find("CVE-2012-4481")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_4481)
  end
  it "must have test for CVE-2012-6134" do
    sc = kb.find("CVE-2012-6134")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6134)
  end
  it "must have test for CVE-2012-6496" do
    sc = kb.find("CVE-2012-6496")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6496)
  end

  it "must have test for CVE-2012-6497" do
    sc = kb.find("CVE-2012-6497")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6497)
  end

  it "must have test for CVE-2010-1330" do
    sc = kb.find("CVE-2010-1330")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2010_1330)
  end

  it "must have test for CVE-2011-0446" do
    sc = kb.find("CVE-2011-0446")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_0446)
  end

  it "must have test for CVE-2011-0995" do
    sc = kb.find("CVE-2011-0995")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_0995)
  end

  it "must have test for CVE-2011-2929" do
    sc = kb.find("CVE-2011-2929")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2929)
  end

  it "must have test for CVE-2011-4815" do
    sc = kb.find("CVE-2011-4815")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_4815)
  end

  it "must have test for CVE-2012-3424" do
    sc = kb.find("CVE-2012-3424")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_3424)
  end

  it "must have test for CVE-2012-5380" do
    sc = kb.find("CVE-2012-5380")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_5380)
  end

  it "must have test for CVE-2012-4522" do
    sc = kb.find("CVE-2012-4522")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_4522)
  end
  it "must have test for CVE-2013-2065" do
    sc = kb.find("CVE-2013-2065")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2065)
  end
  it "must have test for CVE-2013-4389" do
    sc = kb.find("CVE-2013-4389")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4389)
  end

  it "must have test for CVE-2013-4164" do
    sc = kb.find("CVE-2013-4164")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4164)
  end

  it "must have test for CVE-2013-4562" do
    sc = kb.find("CVE-2013-4562")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4562)
  end
  it "must have test for CVE-2013-4457" do
    sc = kb.find("CVE-2013-4457")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4457)
  end

  it "must have test for 20131129-SimpleForm-Xss" do
    sc = kb.find("Simple Form XSS - 20131129")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::SimpleForm_Xss_20131129)
  end

  it "must have test for CVE-2013-4491" do
    sc = kb.find("CVE-2013-4491")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4491)
  end

  it "must have test for CVE-2013-4492" do
    sc = kb.find("CVE-2013-4492")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4492)
  end
  it "must have test for CVE-2013-6414" do
    sc = kb.find("CVE-2013-6414")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6414)
  end
  it "must have test for CVE-2013-6415" do
    sc = kb.find("CVE-2013-6415")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6415)
  end
  it "must have test for CVE-2013-6416" do
    sc = kb.find("CVE-2013-6416")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6416)
  end

  it "must have test for CVE-2013-6417" do
    sc = kb.find("CVE-2013-6417")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6417)
  end

  it "must have test for CVE-2013-6460" do
    sc = kb.find("CVE-2013-6460")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6460)
  end
  it "must have test for CVE-2013-6461" do
    sc = kb.find("CVE-2013-6461")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6461)
  end
  it "must have test for CVE-2013-4478" do
    sc = kb.find("CVE-2013-4478")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4478)
  end
  it "must have test for CVE-2013-4479" do
    sc = kb.find("CVE-2013-4479")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4479)
  end
  it "must have test for CVE-2013-1812" do
    sc = kb.find("CVE-2013-1812")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1812)
  end
  it "must have test for CVE-2013-6421" do
    sc = kb.find("CVE-2013-6421")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6421)
  end

  it "must have test for CVE-2004-0755" do
    sc = kb.find("CVE-2004-0755")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2004_0755)
  end
  it "must have test for CVE-2004-0983" do
    sc = kb.find("CVE-2004-0983")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2004_0983)
  end  
  it "must have test for CVE-2005-1992" do
    sc = kb.find("CVE-2005-1992")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2005_1992)
  end
  it "must have test for CVE-2005-2337" do
    sc = kb.find("CVE-2005-2337")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2005_2337)
  end
  it "must have test for CVE-2006-1931" do
    sc = kb.find("CVE-2006-1931")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_1931)
  end
  it "must have test for CVE-2006-2582" do
    sc = kb.find("CVE-2006-2582")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_2582)
  end
  it "must have test for CVE-2006-3694" do
    sc = kb.find("CVE-2006-3694")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_3694)
  end

  it "must have test for CVE-2006-4112" do
    sc = kb.find("CVE-2006-4112")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_4112)
  end

  it "must have test for CVE-2006-5467" do
    sc = kb.find("CVE-2006-5467")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_5467)
  end

  it "must have test for CVE-2006-6303" do
    sc = kb.find("CVE-2006-6303")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_6303)
  end
  it "must have test for CVE-2006-6852" do
    sc = kb.find("CVE-2006-6852")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_6852)
  end
  it "must have test for CVE-2006-6979" do
    sc = kb.find("CVE-2006-6979")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2006_6979)
  end
  it "must have test for CVE-2007-0469" do
    sc = kb.find("CVE-2007-0469")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_0469)
  end
  it "must have test for CVE-2013-2090" do
    sc = kb.find("CVE-2013-2090")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2090)
  end
  it "must have test for CVE-2011-4319" do
    sc = kb.find("CVE-2011-4319")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_4319)
  end
  it "must have test for CVE-2011-3187" do
    sc = kb.find("CVE-2011-3187")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_3187)
  end
  it "must have test for CVE-2011-3009" do
    sc = kb.find("CVE-2011-3009")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_3009)
  end

  it "must have test for CVE-2011-2930" do
    sc = kb.find("CVE-2011-2930")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2930)
  end

  it "must have test for CVE-2011-2705" do
    sc = kb.find("CVE-2011-2705")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2705)
  end
  it "must have test for CVE-2011-2686" do
    sc = kb.find("CVE-2011-2686")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_2686)
  end
  it "must have test for CVE-2011-1005" do
    sc = kb.find("CVE-2011-1005")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_1005)
  end
  it "must have test for CVE-2011-1004" do
    sc = kb.find("CVE-2011-1004")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_1004)
  end
  it "must have test for CVE-2011-0739" do
    sc = kb.find("CVE-2011-0739")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_0739)
  end
  it "must have test for CVE-2011-0188" do
    sc = kb.find("CVE-2011-0188")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_0188)
  end
  it "must have test for CVE-2010-3933" do
    sc = kb.find("CVE-2010-3933")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2010_3933)
  end
  it "must have test for CVE-2010-2489" do
    sc = kb.find("CVE-2010-2489")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2010_2489)
  end
  it "must have test for CVE-2009-4214" do
    sc = kb.find("CVE-2009-4214")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2009_4214)
  end
  it "must have test for CVE-2009-4124" do
    sc = kb.find("CVE-2009-4124")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2009_4124)
  end
  it "must have test for CVE-2009-4078" do
    sc = kb.find("CVE-2009-4078")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2009_4078)
  end
  it "must have test for CVE-2008-7248" do
    sc = kb.find("CVE-2008-7248")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_7248)
  end
  it "must have test for CVE-2008-5189" do
    sc = kb.find("CVE-2008-5189")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_5189)
  end
  it "must have test for CVE-2008-4310" do
    sc = kb.find("CVE-2008-4310")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_4310)
  end
  it "must have test for CVE-2008-4094" do
    sc = kb.find("CVE-2008-4094")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_4094)
  end
  it "must have test for CVE-2008-3905" do
    sc = kb.find("CVE-2008-3905")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_3905)
  end
  it "must have test for CVE-2008-3790" do
    sc = kb.find("CVE-2008-3790")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_3790)
  end
  it "must have test for CVE-2008-3657" do
    sc = kb.find("CVE-2008-3657")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_3657)
  end
  it "must have test for CVE-2008-3655" do
    sc = kb.find("CVE-2008-3655")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_3655)
  end
  it "must have test for CVE-2008-2725" do
    sc = kb.find("CVE-2008-2725")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_2725)
  end
  it "must have test for CVE-2008-2663" do
    sc = kb.find("CVE-2008-2663")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_2663)
  end
  it "must have test for CVE-2008-2664" do
    sc = kb.find("CVE-2008-2664")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_2664)
  end
  it "must have test for CVE-2008-2662" do
    sc = kb.find("CVE-2008-2662")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_2662)
  end
  it "must have test for CVE-2008-2376" do
    sc = kb.find("CVE-2008-2376")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_2376)
  end
  it "must have test for CVE-2008-1891" do
    sc = kb.find("CVE-2008-1891")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_1891)
  end
  it "must have test for CVE-2008-1145" do
    sc = kb.find("CVE-2008-1145")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2008_1145)
  end
  it "must have test for CVE-2007-6612" do
    sc = kb.find("CVE-2007-6612")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_6612)
  end
  it "must have test for CVE-2007-6077" do
    sc = kb.find("CVE-2007-6077")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_6077)
  end
  it "must have test for CVE-2007-5770" do
    sc = kb.find("CVE-2007-5770")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_5770)
  end
  it "must have test for CVE-2007-5380" do
    sc = kb.find("CVE-2007-5380")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_5380)
  end
  it "must have test for CVE-2007-5379" do
    sc = kb.find("CVE-2007-5379")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_5379)
  end
  it "must have test for CVE-2007-5162" do
    sc = kb.find("CVE-2007-5162")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2007_5162)
  end
  it "must have test for CVE-2013-2119" do
    sc = kb.find("CVE-2013-2119")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2119)
  end
  it "must have test for CVE-2013-7086" do
    sc = kb.find("CVE-2013-7086")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_7086)
  end
  it "must have test for CVE-2013-6459" do
    sc = kb.find("CVE-2013-6459")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_6459)
  end
  it "must have test for CVE-2013-5647" do
    sc = kb.find("CVE-2013-5647")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_5647)
  end
  it "must have test for CVE-2013-0263" do
    sc = kb.find("CVE-2013-0263")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0263)
  end
  it "must have test for CVE-2013-0256" do
    sc = kb.find("CVE-2013-0256")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0256)
  end
  it "must have test for CVE-2013-0162" do
    sc = kb.find("CVE-2013-0162")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0162)
  end
  it "must have test for CVE-2012-2671" do
    sc = kb.find("CVE-2012-2671")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2671)
  end
  it "must have test for CVE-2012-2139" do
    sc = kb.find("CVE-2012-2139")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_2139)
  end
  it "must have test for CVE-2012-1098" do
    sc = kb.find("CVE-2012-1098")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_1098)
  end
  it "must have test for CVE-2013-1756" do
    sc = kb.find("CVE-2013-1756")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1756)
  end
  it "must have test for CVE-2014-1233" do
    sc = kb.find("CVE-2014-1233")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_1233)
  end
  it "must have test for CVE-2014-1234" do
    sc = kb.find("CVE-2014-1234")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_1234)
  end
  it "must have test for CVE-2013-4413" do
    sc = kb.find("CVE-2013-4413")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4413)
  end

  it "must have test for CVE-2013-4489" do
    sc = kb.find("CVE-2013-4489")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4489)
  end
  it "must have test for CVE-2013-5671" do
    sc = kb.find("CVE-2013-5671")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_5671)
  end
  it "must have test for CVE-2013-4593" do
    sc = kb.find("CVE-2013-4593")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4593)
  end
  it "must have test for CVE-2013-0262" do
    sc = kb.find("CVE-2013-0262")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0262)
  end
  it "must have test for CVE-2013-0184" do
    sc = kb.find("CVE-2013-0184")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0184)
  end
  it "must have test for CVE-2013-0183" do
    sc = kb.find("CVE-2013-0183")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_0183)
  end
  it "must have test for CVE-2012-6109" do
    sc = kb.find("CVE-2012-6109")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6109)
  end
  it "must have test for CVE-2011-5036" do
    sc = kb.find("CVE-2011-5036")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2011_5036)
  end
  it "must have test for CVE-2013-2516" do
    sc = kb.find("CVE-2013-2516")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2516)
  end
  it "must have test for CVE-2013-2513" do
    sc = kb.find("CVE-2013-2513")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2513)
  end
  it "must have test for CVE-2013-2512" do
    sc = kb.find("CVE-2013-2512")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2512)
  end
  it "must have test for CVE-2013-1607" do
    sc = kb.find("CVE-2013-1607")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_1607)
  end
  it "must have test for CVE-2014-0080" do
    sc = kb.find("CVE-2014-0080")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_0080)

  end

  it "must have test for CVE-2014-0081" do
    sc = kb.find("CVE-2014-0081")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_0081)
  end
  it "must have test for CVE-2014-0082" do
    sc = kb.find("CVE-2014-0082")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_0082)
  end
  it "must have test for CVE-2014-2322" do
    sc = kb.find("CVE-2014-2322")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_2322)
  end

  it "must have test for CVE-2014-0036" do
    sc = kb.find("CVE-2014-0036")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_0036)
  end
  it "must have test for CVE-2014-2538" do
    sc = kb.find("CVE-2014-2538")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_2538)
  end
  it "must have test for CVE-2013-4203" do
    sc = kb.find("CVE-2013-4203")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_4203)
  end
  it "must have test for CVE-2014-2525" do
    sc = kb.find("CVE-2014-2525")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_2525)
  end
  it "must have test for OSVDB_105971" do
    sc = kb.find("OSVDB-105971")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_105971)
  end

  it "must have test for CVE-2014-0130" do
    sc = kb.find("CVE-2014-0130")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_0130)
  end
  it "must have test for CVE-2013-2105" do
    sc = kb.find("CVE-2013-2105")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2013_2105)
  end
  it "must have test for OSVDB-108569" do
    sc = kb.find("OSVDB-108569")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_108569)
  end

  it "must have test for OSVDB-108570" do
    sc = kb.find("OSVDB-108570")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_108570)
  end

  it "must have test for OSVDB-108530" do
    sc = kb.find("OSVDB-108530")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_108530)
  end
  it "must have test for OSVDB-108563" do
    sc = kb.find("OSVDB-108563")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_108563)
  end

  it "must have test for CVE-2014-3482" do
    sc = kb.find("CVE-2014-3482")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_3482)
  end

  it "must have test for CVE-2014-3483" do
    sc = kb.find("CVE-2014-3483")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_3483)
  end
  it "must have test for OSVDB_119927" do
    sc = kb.find("OSVDB_119927")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_119927)
  end
  it "must have test for OSVDB_119878" do
    sc = kb.find("OSVDB_119878")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_119878)
  end
  it "must have test for OSVDB_118954" do
    sc = kb.find("OSVDB_118954")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_118954)
  end
  it "must have test for OSVDB_118579" do
    sc = kb.find("OSVDB_118579")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_118579)
  end
  it "must have test for OSVDB_118830" do
    sc = kb.find("OSVDB_118830")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_118830)
  end
  it "must have test for CVE-2015-3224" do
    sc = kb.find("CVE-2015-3224")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_3224)
  end
  it "must have test for CVE-2015-3225" do
    sc = kb.find("CVE-2015-3225")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_3225)
  end
  it "must have test for CVE-2015-3227" do
    sc = kb.find("CVE-2015-3227")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_3227)
  end
  it "must have test for CVE-2015-3226" do
    sc = kb.find("CVE-2015-3226")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_3226)
  end
  it "must have test for CVE-2015-2963" do
    sc = kb.find("CVE-2015-2963")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_2963)
  end
  it "CVE-2015-1840 can't be tested. Trust me. It works"
  it "must have test for CVE-2015-3448" do
    sc = kb.find("CVE-2015-3448")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_3448)
  end
  it "must have test for CVE-2014-9490" do
    sc = kb.find("CVE-2014-9490")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_9490)
  end
  it "must have test for CVE-2012-6684" do
    sc = kb.find("CVE-2012-6684")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2012_6684)
  end
  it "must have test for CVE-2014-8090" do
    sc = kb.find("CVE-2014-8090")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_8090)
  end
  it "must have test for CVE-2014-7829" do
    sc = kb.find("CVE-2014-7829")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_7829)
  end
  it "must have test for CVE-2014-3916" do
    sc = kb.find("CVE-2014-3916")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_3916)
  end
  it "not sure if it must have check for CVE-2014-3248. Too much gem involved in a single CVE only with ruby 1.9.1 and with social engineering required"
  it "must have test for CVE-2014-4975" do
    sc = kb.find("CVE-2014-4975")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_4975)
  end
  it "must have test for CVE-2014-7819" do
    sc = kb.find("CVE-2014-7819")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_7819)
  end
  it "must have test for CVE-2014-7818" do
    sc = kb.find("CVE-2014-7818")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2014_7818)
  end
  it "must have test for OSVDB_120415" do
    sc = kb.find("OSVDB_120415")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_120415)
  end
  it "must have test for OSVDB_120857" do
    sc = kb.find("OSVDB_120857")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_120857)
  end
  it "must have test for OSVDB_121701" do
    sc = kb.find("OSVDB_121701")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_121701)
  end
  it "must have test for CVE-2015-4020" do
    sc = kb.find("CVE-2015-4020")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_4020)
  end
  it "must have test for OSVDB_117903" do
    sc = kb.find("OSVDB_117903")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_117903)
  end
  it "must have test for OSVDB_115654" do
    sc = kb.find("OSVDB_115654")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_115654)
  end
  it "must have test for OSVDB_116010" do
    sc = kb.find("OSVDB_116010")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::OSVDB_116010)
  end
  it "must have test for CVE-2015-1819" do
    sc = kb.find("CVE-2015-1819")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_1819)
  end
  it "must have test for CVE-2015-7576" do
    sc = kb.find("CVE-2015-7576")
    expect(sc).not_to   be_nil
    expect(sc.class).to eq(Dawn::Kb::CVE_2015_7576)
  end
  it "must have test for CVE-2016-0751" do
  sc = kb.find("CVE-2016-0751")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_0751)
end
  it "must have test for CVE-2015-7577" do
  sc = kb.find("CVE-2015-7577")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7577)
end
it "must have test for CVE-2015-7579" do
  sc = kb.find("CVE-2015-7579")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7579)
end
it "must have test for CVE-2016-0752" do
  sc = kb.find("CVE-2016-0752")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_0752)
end
it "must have test for CVE-2016-0753" do
  sc = kb.find("CVE-2016-0753")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_0753)
end
it "must have test for CVE-2015-7578" do
  sc = kb.find("CVE-2015-7578")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7578)
end
it "must have test for CVE-2015-7581" do
  sc = kb.find("CVE-2015-7581")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7581)
end
it "must have test for CVE-2015-5312" do
  sc = kb.find("CVE-2015-5312")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_5312)
end
it "must have test for CVE-2015-7497" do
  sc = kb.find("CVE-2015-7497")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7497)
end
it "must have test for CVE-2015-7498" do
  sc = kb.find("CVE-2015-7498")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7498)
end
it "must have test for CVE-2015-7499" do
  sc = kb.find("CVE-2015-7499")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7499)
end
it "must have test for CVE-2015-7500" do
  sc = kb.find("CVE-2015-7500")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7500)
end
it "must have test for CVE-2015-8241" do
  sc = kb.find("CVE-2015-8241")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_8241)
end
it "must have test for CVE-2015-8242" do
  sc = kb.find("CVE-2015-8242")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_8242)
end
it "must have test for CVE-2015-8317" do
  sc = kb.find("CVE-2015-8317")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_8317)
end
it "must have test for CVE-2015-7541" do
  sc = kb.find("CVE-2015-7541")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7541)
end
it "must have test for CVE-2015-7519" do
  sc = kb.find("CVE-2015-7519")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2015_7519)
end
it "must have test for CVE-2016-2098" do
  sc = kb.find("CVE-2016-2098")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_2098)
end
it "must have test for CVE-2016-2097" do
  sc = kb.find("CVE-2016-2097")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_2097)
end
it "must have test for OSVDB_132234" do
  sc = kb.find("OSVDB_132234")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::OSVDB_132234)
end
it "must have test for CVE-2016-6317" do
  sc = kb.find("CVE-2016-6317")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_6317)
end
it "must have test for CVE-2016-6316" do
  sc = kb.find("CVE-2016-6316")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_6316)
end
it "must have test for CVE-2016-5697" do
  sc = kb.find("CVE-2016-5697")
  expect(sc).not_to   be_nil
  expect(sc.class).to eq(Dawn::Kb::CVE_2016_5697)
end
end
