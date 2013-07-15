require 'spec_helper'

describe "The OWASP Ruby on Rails cheatsheet" do

  it "says that running operating system commands from a ruby app can be dangerous"
  it "says that methods fetching data must validate parameters form request"
  it "says that applications must filter data to avoid XSS"
  it "says that applications must tune session cookies to have them to expire or to store them in a database"
  it "says that applications must tune devise parameters"
  it "says that you have to implement some access control to your REST code (e.g. using cancan)"
  it "says that protect_from_forgery must be enabled"
  it "says that your models must take care about not declaring attr_accessor fields to avoid mass assignements"
  it "says redirect_to calls in your code must use only_path=true param that lets your code to be safe against forceful browsing"
  it "says that pages passed to render call must not under the user control"
  it "says that applications must implement the same-origin control when handling data"
  it "says that applications must use HTTP headers designed for security"
  it "says that you have to perform code reviews to avoid business logic faults. Using codesake dawn is great :-)"
  it "says that you have to manually check your routes to avoid a widespread attack surface."
  it "says that you must not implement your own encryption code, and in case of devise usage using 10 stretches for production is good"

end
