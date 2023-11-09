require 'spec_helper'

describe "The Sinatra AST processor " do
  before(:all) do
    @parsed_code = Dawn::Core.read_and_parse_a_source_file('./spec/support/reflected_xss_sinatra_app.rb')
    @ast = Dawn::Processor::Sinatra.new
    @ast.process_all(@parsed_code)
  end

  it " exists and it's my friend" do
    puts @ast.inspect
    true
  end

end
