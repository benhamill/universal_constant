require 'spec_helper'

describe UniversalConstant::Game do
  describe ".new" do
    it "creates a new Player object" do
      UniversalConstant::Player.stub!(:new) { :player }

      UniversalConstant::Game.new.player.should == :player
    end
  end

  describe "#player_location" do
    it "returns the player's current location" do
      player = double('Player', :location => :at_home)
      UniversalConstant::Player.stub!(:new) { player }

      UniversalConstant::Game.new.player_location.should == :at_home
    end
  end
end
