require 'spec_helper'

describe UniversalConstant::Commands do
  describe "#process_input" do
    it "returns an object with an apology message for commands it doesn't know" do
      result = subject.process_input("do a jig")

      result.message.should == "I don't know the command 'do a jig'."
    end
  end

  describe "look" do
    it "returns a RoomPresenter" do
      location = double(:description => 'It is very dark.', :name => 'Dank Hallway')
      $game = double('Game', :player_location => location)

      result = subject.process_input('look')

      result.should be_a(UniversalConstant::RoomPresenter)
    end
  end

  describe "quit" do
    it "throws the :exit_game signal" do
      expect { subject.process_input('quit') }.to throw_symbol(:exit_game)
    end
  end
end
