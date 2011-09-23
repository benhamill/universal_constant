require 'spec_helper'

describe UniversalConstant::Room do
  describe ".new" do
    it "defaults exits to empty" do
      UniversalConstant::Room.new.exits.should be_empty
    end

    it "doesn't allow the setting of exits" do
      UniversalConstant::Room.new(:exits => :foo).exits.should_not == :foo
    end

    it "doesn't fuck up id assignment" do
      UniversalConstant::Room.new.id.should_not be_nil
    end
  end

  describe "#add_exit" do
    before(:each) do
      @start_room = UniversalConstant::Room.new(:name => 'The Study')
      @new_room = UniversalConstant::Room.new(:name => 'The Hall')
      @start_room.add_exit('out', @new_room)
    end

    it "adds a new exit to the starting @room" do
      @start_room.exit?('out').should be_true
      @start_room.exit('out').should === @new_room
    end

    it "doesn't add a connecting exit back from the new @room to the starting one" do
      @new_room.exits.should be_empty
    end
  end

  describe "#exit?" do
    before(:each) do
      @room = UniversalConstant::Room.new
      @room.add_exit('yes', double('Room'))
    end

    it "returns true of the @room has an exit named that" do
      @room.exit?('yes').should be_true
    end

    it "returns false if the @room doesn't have an exit named that" do
      @room.exit?('nope').should be_false
    end
  end

  describe "#exit" do
    before(:each) do
      @room = UniversalConstant::Room.new
      @new_room = UniversalConstant::Room.new
      @room.add_exit('up', @new_room)
    end

    it "returns the @room that the named exit goes to" do
      @room.exit('up').should === @new_room
    end

    it "returns nil if there is no exit thusly named" do
      @room.exit('down').should be_nil
    end
  end

  describe "#dig" do
    context "with all three arguments" do
      before(:each) do
        @start_room = UniversalConstant::Room.new(:name => 'The Yard')
        @new_room = @start_room.dig('in', 'The House', 'out')
      end

      it "creates and returns a new Room named right" do
        @new_room.should be_a(UniversalConstant::Room)
        @new_room.name.should == 'The House'
      end

      it "opens an exit from the first @room to the new one" do
        @start_room.exit?('in').should be_true
        @start_room.exit('in').should === @new_room
      end

      it "opens an exit from the new @room to the first one" do
        @new_room.exit?('out').should be_true
        @new_room.exit('out').should === @start_room
      end
    end
  end
end
