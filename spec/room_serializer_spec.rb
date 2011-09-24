require 'spec_helper'

describe UniversalConstant::RoomSerializer do
  before(:each) do
    @room = UniversalConstant::Room.new(:name => 'A Hut', :description => 'A decrepid hovel.')
    @outside = @room.dig('out', 'Outside', :back => 'hut')
    @outside.description = 'Hot out here.'

    @serializer = UniversalConstant::RoomSerializer.new(@room)
  end

  describe "#to_yaml" do
    it "encodes the room's attributes in yaml" do
      @serializer.to_yaml.should == YAML.dump({
        'id' => @room.id,
        'name' => @room.name,
        'description' => @room.description,
        'exits' => {
          'out' => @outside.id
        }
      })
    end
  end
end
