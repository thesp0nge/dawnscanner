require 'spec_helper'

describe "The OWASP Ruby on Rails cheatsheet" do

  before(:all) do
    @engine = Dawn::Rails.new("./spec/support/hello_world_3.2.13")
    @applied = @engine.apply("Owasp Ror Cheatsheet")
    owasp_ror = @engine.find_vulnerability_by_name("Owasp Ror Cheatsheet") if @applied
    @vc = []
    @vc = owasp_ror[:vulnerable_checks] unless owasp_ror.nil?
  end 

  it "is correctly applied" do
    expect(@applied).to eq(true)
  end

  it "fires up vulnerabilities" do
    expect(@engine.is_vulnerable_to?("Owasp Ror Cheatsheet")).to eq(true)
  end

  it "says that running operating system commands from a ruby app can be dangerous" do
    ev = @engine.vulnerabilities[0][:vulnerable_checks][0].evidences
    expect(@engine.vulnerabilities[0][:vulnerable_checks][0]).to be_an_instance_of(Dawn::Kb::OwaspRorCheatSheet::CommandInjection)
    expect(ev[0][:filename]).to eq("./spec/support/hello_world_3.2.13/app/helpers/application_helper.rb")
    expect(ev[0][:matches].count).to eq(4)
    expect(ev[0][:matches]).to match_array([{:match=>"    eval(command)\n", :line=>4}, {:match=>"    System(command)\n", :line=>5}, {:match=>"    `\#{command}`\n", :line=>6}, {:match=>"    Kernel.exec(command)\n", :line=>7}])
  end

  it "says that methods fetching data must validate parameters form request"
  it "says that applications must filter data to avoid XSS"
  it "says that applications must tune session cookies to have them to expire or to store them in a database" do
    sessions = Dawn::Kb::ComboCheck.find_vulnerable_checks_by_class(@vc, Dawn::Kb::OwaspRorCheatSheet::SessionStoredInDatabase)
    expect(sessions).to  be_nil
  end
  it "says that applications must tune devise parameters"
  it "says that you have to implement some access control to your REST code (e.g. using cancan)"
  it "says that protect_from_forgery must be enabled" do 
    forgery = Dawn::Kb::ComboCheck.find_vulnerable_checks_by_class(@vc, Dawn::Kb::OwaspRorCheatSheet::Csrf)
    expect(forgery).to  be_nil
  end
  it "says that your models must take care about not declaring attr_accessor fields to avoid mass assignements" do
    mass_assignment = Dawn::Kb::ComboCheck.find_vulnerable_checks_by_class(@vc, Dawn::Kb::OwaspRorCheatSheet::MassAssignmentInModel)
    expect(mass_assignment).not_to be_nil
  end
  it "says redirect_to calls in your code must use only_path=true param that lets your code to be safe against forceful browsing"
  it "says that pages passed to render call must not under the user control"
  it "says that applications must implement the same-origin control when handling data"
  it "says that applications must use HTTP headers designed for security" do
    headers = Dawn::Kb::ComboCheck.find_vulnerable_checks_by_class(@vc, Dawn::Kb::OwaspRorCheatSheet::SecurityRelatedHeaders)
    expect(headers).not_to be_nil
  end
  it "says that you have to perform code reviews to avoid business logic faults. Using codesake dawn is great :-)"
  it "says that you have to manually check your routes to avoid a widespread attack surface."
  it "says that you must not implement your own encryption code, and in case of devise usage using 10 stretches for production is good"

end
