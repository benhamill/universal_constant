require 'spec_helper'

describe UniversalConstant::Game::UI do
  let(:output) { @output.string }

  before(:each) do
    @output = StringIO.new
    subject.class_variable_set(:@@output_stream, @output)
  end

  describe "#say" do
    it "prints out the string representation of what's passed in" do
      subject.say('It is very dark.')

      output.should == "It is very dark.\n"
    end
  end

  describe "#list" do
    it "lists each string in passed in, numbered" do
      subject.list('First item', 'Second item', 'Third item')

      output.should == <<-OUT
1. First item
2. Second item
3. Third item
OUT
    end
  end

  describe "#ask" do
    it "displays a message and returns user input" do
      subject.stub(:gets) { 'Nada mucho' }

      subject.ask("What's up?").should == 'Nada mucho'
      output.should == "What's up?\n> "
    end

    it "just displays the prompt with no message" do
      subject.stub(:gets) { 'look' }

      subject.ask.should == 'look'
      output.should == "> "
    end
  end
end
