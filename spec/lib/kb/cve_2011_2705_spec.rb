require 'spec_helper'
describe "The CVE-2011-2705 vulnerability" do
	before(:all) do
		@check = Dawn::Kb::CVE_2011_2705.new
		# @check.debug = true
	end
  it "fires when ruby 1.8.7-p351 is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p351"}
    expect(@check.vuln?).to eq(true)
  end
  it "fires when ruby 1.9.0 any patchlevel is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.9.0", :patchlevel=>"p351"}
    expect(@check.vuln?).to eq(true)
  end
  it "fires when ruby 1.9.1 any patchlevel is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.9.1", :patchlevel=>"p351"}
    expect(@check.vuln?).to eq(true)
  end
  it "fires when ruby 1.9.2-p289 is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p289"}
    expect(@check.vuln?).to eq(true)
  end
  it "doesn't fire when ruby 1.8.7-p352 is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.8.7", :patchlevel=>"p352"}
    expect(@check.vuln?).to eq(false)
  end
  it "doesn't fire when ruby 1.9.2-p290 is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.9.2", :patchlevel=>"p290"}
    expect(@check.vuln?).to eq(false)
  end
  it "doesn't fire when ruby 1.9.3-p290 is detected" do
    @check.detected_ruby ={:engine=>"ruby", :version=>"1.9.3", :patchlevel=>"p290"}
    expect(@check.vuln?).to eq(false)
  end
end
