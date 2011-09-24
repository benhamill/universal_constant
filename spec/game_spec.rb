require 'spec_helper'

describe UniversalConstant::Game do
  describe ".new" do
    it "creates a new Player object" do
      UniversalConstant::Game.new.player.should be_a(UniversalConstant::Player)
    end

    it "assigns the starting location to the GameObject with the given id" do
      10.times { UniversalConstant::Room.new }

      UniversalConstant::Game.new(5).starting_location.should === UniversalConstant::GameObject.find(5)
    end

    it "defaults the starting location to the GameObject with id 0" do
      10.times { UniversalConstant::Room.new }

      UniversalConstant::Game.new.starting_location.should === UniversalConstant::GameObject.find(0)
    end
  end

  describe "#player_location" do
    it "returns the player's current location" do
      subject.player.location = :home

      subject.player_location.should == :home
    end
  end

  describe "#move_player_to" do
    it "reassigns the player's location to the new object" do
      subject.player.location = :home

      subject.move_player_to(:work)

      subject.player.location.should == :work
    end
  end
end
