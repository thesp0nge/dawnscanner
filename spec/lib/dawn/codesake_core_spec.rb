require 'spec_helper'

describe "The Core" do
  describe "#find_conf" do
    it "returns path name if true passed" do
      expect(Dawn::Core.find_conf(true)).not_to be_nil
    end
  end
end
