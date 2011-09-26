module UniversalConstant
  class RoomSerializer
    def initialize(room)
      @room = room
    end

    def serialize
      y = YAML.dump({
        'class' => @room.class.name,
        'id' => @room.id,
        'name' => @room.name,
        'description' => @room.description,
        'exits' => @room.exits.inject({}) do |memo, (exit_name, room)|
          memo[exit_name] = room.id

          memo
        end
      })
    end
  end
end
