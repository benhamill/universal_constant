module UniversalConstant
  class RoomSerializer
    def initialize(room)
      @room = room
    end

    def to_yaml
      y = YAML.dump({
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
