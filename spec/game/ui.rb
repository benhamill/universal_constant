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
end
