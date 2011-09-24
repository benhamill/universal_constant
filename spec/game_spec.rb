require 'spec_helper'

describe UniversalConstant::Game do
  describe ".new" do
    before(:all) do
      clear_object_cache
      10.times { UniversalConstant::Room.new }
    end

    it "creates a new Player object" do
      UniversalConstant::Game.new.player.should be_a(UniversalConstant::Player)
    end

    it "assigns the starting location to the GameObject with the given id" do
      UniversalConstant::Game.new(:start_id => 5).starting_location.should === UniversalConstant::GameObject.find(5)
    end

    it "defaults the starting location to the GameObject with id 0" do
      UniversalConstant::Game.new.starting_location.should === UniversalConstant::GameObject.find(0)
    end

    it "has a name" do
      UniversalConstant::Game.new(:name => 'fred').name.should == 'fred'
    end

    it "defaults the name to 'new game'" do
      UniversalConstant::Game.new.name.should == 'new game'
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

  describe "#save" do
    it "makes a new GameSerializer and calls serialize on it" do
      serializer = double('GameSerializer')
      UniversalConstant::GameSerializer.should_receive(:new).with(subject, 'some/path/') { serializer }
      serializer.should_receive(:serialize)

      subject.save('some/path/')
    end
  end
end
