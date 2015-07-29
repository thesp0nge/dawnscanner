require 'spec_helper'
describe "The OSVDB_118954 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::OSVDB_118954.new
		# @check.debug = true
	end
	it "Currently, there are no known workarounds or upgrades to correct this issue. However, a patch has been committed to the source code repository (e.g. GIT, CVS, SVN) that addresses this vulnerability. Until it is incorporated into the next release of the software, manually patching an existing installation is the only known available solution. Check the vendor links in the references section for more information"
end
