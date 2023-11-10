require 'spec_helper'

describe "dawnscanner core APIs " do
  it "find_conf() returns path name if true passed" do
    expect(Dawn::Core.find_conf(true)).not_to be_nil
  end

  it "read_and_parse_a_source_file() returns nil if a non existent file is given as input" do
    expect(Dawn::Core.read_and_parse_a_source_file("./this_file_does_not_exist.rb")).to be nil
  end

  it "read_and_parse_a_source_file() returns nil if the given input name exists but it's a directory" do
    expect(Dawn::Core.read_and_parse_a_source_file("./spec/lib/dawn")).to be nil
  end

  it "read_and_parse_a_source_file() returns nil in case of a parse error" do
    expect(Dawn::Core.read_and_parse_a_source_file("./spec/support/malformed.rb")).to be nil
  end


end
