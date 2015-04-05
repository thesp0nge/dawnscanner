require 'spec_helper'
describe "The OSVDB_118579 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_118579.new
		# @check.debug = true
	end
	it "We are not currently aware of a solution for this vulnerability."
end
