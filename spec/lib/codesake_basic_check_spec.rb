require 'spec_helper'

describe "A generic static analysis check will" do
  before (:all) { @check = Codesake::Dawn::BasicCheck.new }
  it "has a applies? method" do
    @check.should respond_to(:applies?)
  end
  it "has an apply method" 
end
