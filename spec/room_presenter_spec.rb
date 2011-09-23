require 'spec_helper'

describe UniversalConstant::RoomPresenter do
  describe "#message" do
    context "with a room with just a name and description" do
      before(:each) do
        room = UniversalConstant::Room.new(:name => 'Dank Hallway', :description => 'It is very dark.')
        @presenter = UniversalConstant::RoomPresenter.new(room)
      end

      it "has the right message" do
        @presenter.message.should == <<-MSG
Dank Hallway
It is very dark.

There are no exits here.
MSG
      end
    end

    context "with a room with a name, description and exits" do
      before(:each) do
        room = UniversalConstant::Room.new(:name => 'Amidships', :description => 'The sea spray is nice here.')
        room.add_exit('Aft', double('Room'))
        room.add_exit('Forward', double('Room'))

        @presenter = UniversalConstant::RoomPresenter.new(room)
      end

      it "has the right message" do
        @presenter.message.should == <<-MSG
Amidships
The sea spray is nice here.

Exits are: Aft, Forward
MSG
      end
    end
  end
end
