require 'spec_helper'

describe UniversalConstant::Commands do
  describe "#look" do
    it "returns an object with a message of the description of the player's current location" do
      location = double(:description => 'It is very dark.')
      UniversalConstant::Game.stub!(:player_location) { location }

      result = subject.look

      result.message.should == 'It is very dark.'
    end
  end
end
