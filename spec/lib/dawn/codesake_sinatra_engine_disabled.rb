require 'spec_helper'

describe "The Dawn engine for sinatra applications" do
  before(:all) {@engine= Dawn::Sinatra.new('./spec/support/sinatra-safe')}

  it "has a proper name" do
    @engine.name.should   ==    "sinatra"
  end

  it "detects the default application name" do
    @engine.appname.should == "application.rb"
  end
  it "has a valid target" do
    @engine.target.should ==   "./spec/support/sinatra-safe"
    @engine.target_is_dir?.should  be_true
  end

  it "has a good Gemfile.lock" do
    @engine.has_gemfile_lock?.should   be_true
  end

  it "detects a sinatra 1.4.4" do
    @engine.mvc_version.should   == "1.4.4"
  end

  it "detects 2 views" do
    @engine.views.should == [{:filename=>"./spec/support/sinatra-safe/views/layout.haml", :language=>:haml}, {:filename=>"./spec/support/sinatra-safe/views/root.haml", :language=>:haml}]
  end
  it "detects views are written using HAML" do
    @engine.views[0][:language].should == :haml
    @engine.views[1][:language].should == :haml
  end

  it "has some check in the knowledge base" do
    @engine.checks.should_not be_nil 
    @engine.checks.should_not be_empty
  end
  it "has check for CVE-2013-1800" do
    Dawn::KnowledgeBase.find(@engine.checks, "CVE-2013-1800").should_not  be_nil
  end

  it "applies all checks" do
    @engine.apply_all.should  be_true
  end
  it "applies check for CVE-2013-1800" do
    @engine.apply("CVE-2013-1800").should   be_true
  end
  
  it "applies check for \"Not revised code\"" do
    @engine.apply("Not revised code").should  be_true
  end 

  describe "applied to sinatra-safe application" do
    it "reports it's not vulnerable to CVE-2013-1800" do
      @engine.is_vulnerable_to?("CVE-2013-1800").should be_false
    end

    it "reports it's not vulnerable to \"Not revised code\"" do
      @engine.is_vulnerable_to?("Not revised code").should  be_false
    end

    it "reports it has no vulnerabilities" do
      puts @engine.vulnerabilities
      @engine.vulnerabilities.should  be_empty
    end
  end  

  describe "applied do the sinatra-vulnerable application" do
    before (:all) {@engine= Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')}
    it "has a valid target" do
      @engine.target.should ==   "./spec/support/sinatra-vulnerable"
      @engine.target_is_dir?.should  be_true
    end

    it "detects running ruby as the one to be checked against" do
      @engine.ruby_version[:version].should == RUBY_VERSION
    end

    it "reports it's vulnerable to CVE-2013-1800" do
      @engine.is_vulnerable_to?("CVE-2013-1800").should be_true
    end

    it "reports it's vulnerable to \"Not revised code\"" do
      @engine.is_vulnerable_to?("Not revised code").should  be_true
    end

    it "reports it has vulnerabilities" do
      @engine.vulnerabilities.should_not  be_empty
    end

    it "applies automagically all the tests if no test has been applied" do
      e2 =  Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')
      e2.vulnerabilities.should_not be_empty
    end

    context "when scanning for XSS" do
      it "detects 3 views" do
        @engine.views.should == [
          {:filename=>"./spec/support/sinatra-vulnerable/views/layout.haml", :language=>:haml}, 
          {:filename=>"./spec/support/sinatra-vulnerable/views/root.haml", :language=>:haml}, 
          {:filename=>"./spec/support/sinatra-vulnerable/views/xss.haml", :language=>:haml}
        ]
      end
      it "detects views are written using HAML" do
        @engine.views[0][:language].should == :haml
        @engine.views[1][:language].should == :haml
        @engine.views[2][:language].should == :haml
      end

      it "detects a sink on application.rb" do
        sink = @engine.detect_sinks("application.rb")
        sink.should == [ 
          {:sink_name=>"@xss_param", :sink_kind=>:params, :sink_line=>26, :sink_source=>"name", :sink_file=>"application.rb", :sink_evidence=>"  @xss_param = params['name']"},
          {:sink_name=>"@my_arr", :sink_kind=>:params, :sink_line=>27, :sink_source=>"second", :sink_file=>"application.rb", :sink_evidence=>"  @my_arr[0] = params['second']"}
        ]
      end

      it "detects reflected ones in HAML views" do
        reflected_xss= @engine.detect_reflected_xss
        @engine.reflected_xss.should_not be_nil
        @engine.reflected_xss.should_not be_empty 
        @engine.reflected_xss.should == [
          {:sink_name=>"@xss_param", :sink_kind=>:params, :sink_line=>26, :sink_source=>"name", :sink_file=>"application.rb", :sink_evidence=>"  @xss_param = params['name']", :sink_view=>"./spec/support/sinatra-vulnerable/views/xss.haml"}
        ]
      end
    end
  end
end
