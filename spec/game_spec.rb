require 'spec_helper'

describe UniversalConstant::Game do
  describe ".new" do
    it "creates a new Player object" do
      UniversalConstant::Game.new.player.should be_a(UniversalConstant::Player)
    end
  end

  describe "#player_location" do
    it "returns the player's current location" do
      subject.player.location = :at_home

      subject.player_location.should == :at_home
    end
  end
end
