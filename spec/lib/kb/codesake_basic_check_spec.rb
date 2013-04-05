require 'spec_helper'

describe "A generic static analysis check will" do
  before (:all) do
    f=File.open("./spec/support/lorem.txt", "r")
    lorem_ipsum = f.readlines
    f.close
    
    options = {:target_version => '2.3.11', :fixes_version => ['2.3.18', '3.2.13', '3.1.12'], :lines=>lorem_ipsum, :attack_pattern=>'luctus' } 
    @check = Codesake::Dawn::Kb::BasicCheck.new(options)
  end

  it "has an run method" do
    @check.should respond_to(:run)
  end
  it "has a is_vulnerable_version? method" do
    @check.should respond_to(:is_vulnerable_version?)
  end

  it "detects if the MVC framework version is vulnerable" do
    @check.is_vulnerable_version?.should            be_true
    @check.is_vulnerable_version?('2.3.19').should  be_false
    @check.is_vulnerable_version?('3.0.19').should  be_true
    @check.is_vulnerable_version?('3.2.13').should  be_false
  end

  it "returns an array saying luctus is present 2 times" do
    results  = @check.run
    results.size.should == 2
    results[0][:line].should == 12
    results[1][:line].should == 18
  end

  it "refuses to run a check if lines are empty" do
    options = {:target_version => '2.3.11', :fixes_version => ['2.3.18', '3.2.13', '3.1.12'], :attack_pattern=>'luctus' } 
    invalid_check = Codesake::Dawn::Kb::BasicCheck.new(options)

    invalid_check.run.should  be_empty
  end

  it "can load a bunch of lines" do
    old_lines = @check.lines
    f=File.open("./spec/support/lorem.txt", "r")
    lorem_ipsum = f.readlines
    f.close

    @check.load_lines(lorem_ipsum)
    @check.lines.should == old_lines

  end

  it "can load a source file" do
    old_lines = @check.lines

    @check.load_file("./spec/support/lorem.txt")
    @check.lines.should == old_lines
  end
end
