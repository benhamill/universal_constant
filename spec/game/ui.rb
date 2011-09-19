require 'spec_helper'

describe UniversalConstant::Game::UI do
  describe "#say" do
    it "prints out the string representation of what's passed in" do
      subject.should_receive(:puts).with('It is very dark.')
      subject.say('It is very dark.')
    end
  end
end
