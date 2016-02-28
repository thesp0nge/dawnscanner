require 'spec_helper'

describe "The Dawn engine for sinatra applications" do
  before(:all) {@engine= Dawn::Sinatra.new('./spec/support/sinatra-safe')}

  it "has a proper name" do
    expect(@engine.name).to   eq("sinatra")
  end

  it "detects the default application name" do
    expect(@engine.appname).to eq("application.rb")
  end
  it "has a valid target" do
    expect(@engine.target).to eq("./spec/support/sinatra-safe")
    expect(@engine.target_is_dir?).to  be_truthy
  end

  it "has a good Gemfile.lock" do
    expect(@engine.has_gemfile_lock?).to   be_truthy
  end

  it "detects a sinatra 1.4.4" do
    expect(@engine.mvc_version).to   eq("1.4.4")
  end

  it "detects 2 views" do
    expect(@engine.views).to eq([{:filename=>"./spec/support/sinatra-safe/views/layout.haml", :language=>:haml}, {:filename=>"./spec/support/sinatra-safe/views/root.haml", :language=>:haml}])
  end
  it "detects views are written using HAML" do
    expect(@engine.views[0][:language]).to eq(:haml)
    expect(@engine.views[1][:language]).to eq(:haml)
  end

  it "has some check in the knowledge base" do
    expect(@engine.checks).not_to be_nil 
    expect(@engine.checks).not_to be_empty
  end
  it "has check for CVE-2013-1800" do
    expect(Dawn::KnowledgeBase.find(@engine.checks, "CVE-2013-1800")).not_to  be_nil
  end

  it "applies all checks" do
    expect(@engine.apply_all).to  be_truthy
  end
  it "applies check for CVE-2013-1800" do
    expect(@engine.apply("CVE-2013-1800")).to   be_truthy
  end
  
  it "applies check for \"Not revised code\"" do
    expect(@engine.apply("Not revised code")).to  be_truthy
  end 

  describe "applied to sinatra-safe application" do
    it "reports it's not vulnerable to CVE-2013-1800" do
      expect(@engine.is_vulnerable_to?("CVE-2013-1800")).to be_falsey
    end

    it "reports it's not vulnerable to \"Not revised code\"" do
      expect(@engine.is_vulnerable_to?("Not revised code")).to  be_falsey
    end

    it "reports it has no vulnerabilities" do
      puts @engine.vulnerabilities
      expect(@engine.vulnerabilities).to  be_empty
    end
  end  

  describe "applied do the sinatra-vulnerable application" do
    before (:all) {@engine= Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')}
    it "has a valid target" do
      expect(@engine.target).to eq("./spec/support/sinatra-vulnerable")
      expect(@engine.target_is_dir?).to  be_truthy
    end

    it "detects running ruby as the one to be checked against" do
      expect(@engine.ruby_version[:version]).to eq(RUBY_VERSION)
    end

    it "reports it's vulnerable to CVE-2013-1800" do
      expect(@engine.is_vulnerable_to?("CVE-2013-1800")).to be_truthy
    end

    it "reports it's vulnerable to \"Not revised code\"" do
      expect(@engine.is_vulnerable_to?("Not revised code")).to  be_truthy
    end

    it "reports it has vulnerabilities" do
      expect(@engine.vulnerabilities).not_to  be_empty
    end

    it "applies automagically all the tests if no test has been applied" do
      e2 =  Dawn::Sinatra.new('./spec/support/sinatra-vulnerable')
      expect(e2.vulnerabilities).not_to be_empty
    end

    context "when scanning for XSS" do
      it "detects 3 views" do
        expect(@engine.views).to eq([
          {:filename=>"./spec/support/sinatra-vulnerable/views/layout.haml", :language=>:haml}, 
          {:filename=>"./spec/support/sinatra-vulnerable/views/root.haml", :language=>:haml}, 
          {:filename=>"./spec/support/sinatra-vulnerable/views/xss.haml", :language=>:haml}
        ])
      end
      it "detects views are written using HAML" do
        expect(@engine.views[0][:language]).to eq(:haml)
        expect(@engine.views[1][:language]).to eq(:haml)
        expect(@engine.views[2][:language]).to eq(:haml)
      end

      it "detects a sink on application.rb" do
        sink = @engine.detect_sinks("application.rb")
        expect(sink).to eq([ 
          {:sink_name=>"@xss_param", :sink_kind=>:params, :sink_line=>26, :sink_source=>"name", :sink_file=>"application.rb", :sink_evidence=>"  @xss_param = params['name']"},
          {:sink_name=>"@my_arr", :sink_kind=>:params, :sink_line=>27, :sink_source=>"second", :sink_file=>"application.rb", :sink_evidence=>"  @my_arr[0] = params['second']"}
        ])
      end

      it "detects reflected ones in HAML views" do
        reflected_xss= @engine.detect_reflected_xss
        expect(@engine.reflected_xss).not_to be_nil
        expect(@engine.reflected_xss).not_to be_empty 
        expect(@engine.reflected_xss).to eq([
          {:sink_name=>"@xss_param", :sink_kind=>:params, :sink_line=>26, :sink_source=>"name", :sink_file=>"application.rb", :sink_evidence=>"  @xss_param = params['name']", :sink_view=>"./spec/support/sinatra-vulnerable/views/xss.haml"}
        ])
      end
    end
  end
end
