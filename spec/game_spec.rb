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

  describe "#starting_location" do
    context "when GameObject #0 is a Room" do
      before(:each) do
        clear_object_cache
        UniversalConstant::Room.new
      end

      it "finds and returns it" do
        subject.starting_location.should == UniversalConstant::GameObject.find(0)
      end
    end

    context "when GameObject #5 is the first Room" do
      before(:each) do
        clear_object_cache
        UniversalConstant::GameObject.new
        UniversalConstant::GameObject.new
        UniversalConstant::GameObject.new
        UniversalConstant::GameObject.new
        UniversalConstant::GameObject.new
        UniversalConstant::Room.new
      end

      it "finds and returns it" do
        subject.starting_location.should == UniversalConstant::GameObject.find(5)
      end
    end
  end
end
