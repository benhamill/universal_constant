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
      location = UniversalConstant::Room.new(:description => 'It is very dark.', :name => 'Dank Hallway')
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

  describe "go" do
    before(:each) do
      @top = UniversalConstant::Room.new(:description => 'Up high', :name => 'Top')
      @bottom = @top.dig('Down', 'Bottom', :back => 'Up')
      @bottom.description = 'Down low.'

      $game = UniversalConstant::Game.new
      $game.player.location = @top
    end

    context "when an exit name is given" do
      before(:each) do
        @result = subject.process_input('go down')
      end

      it "moves the player to the new room when an exit is named" do
        $game.player_location.should === @bottom
      end

      it "performs look for the player" do
        @result.message.should match(/^Bottom/)
      end
    end

    context "when an exit name is NOT given" do
      before(:each) do
        @result = subject.process_input('go around')
      end

      it "asks for clarification" do
        @result.message.should == "Go where? That's not an exit here."
      end
    end
  end
end
