require 'spec_helper'

describe "The Codesake::Core" do
  describe "#find_conf" do
    it "returns path name if true passed" do
      Codesake::Dawn::Core.find_conf(true).should_not be_nil
    end
  end
end