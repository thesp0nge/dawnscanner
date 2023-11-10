require 'spec_helper'

describe "The Sinatra AST processor " do
  before(:all) do
    @parsed_code = Dawn::Core.read_and_parse_a_source_file('./spec/support/reflected_xss_sinatra_app.rb')
    @ast = Dawn::Processor::Sinatra.new
    @ast.process_all(@parsed_code)
  end

  it " exists and it's my friend" do
    true
  end

  describe " when applied to the reflected_xss_sinatra_app " do
    it "founds 2 routes" do
      expect(@ast.routes.count).to be == 2
    end
    it " must have a route to '/' using GET http verb" do
      r = @ast.routes[0]
      expect(r[:method]).to be == "GET"
      expect(r[:name]).to   be == "/"
      expect(r[:params]).to be == []
    end

  end

end
