require 'spec_helper'

describe UniversalConstant::Commands do
  describe "#look" do
    it "returns a RoomPresenter" do
      location = double(:description => 'It is very dark.', :name => 'Dank Hallway')
      $game = double('Game', :player_location => location)

      result = subject.look

      result.should be_a(UniversalConstant::RoomPresenter)
    end
  end

  describe "#method_missing" do
    it "returns an object with an apology message for commands it doesn't know" do
      result = subject.not_a_command

      result.message.should == "I don't know the command not_a_command."
    end
  end
end
