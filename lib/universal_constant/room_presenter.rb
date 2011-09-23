module UniversalConstant
  class RoomPresenter
    attr_accessor :message

    def initialize(room)
      @room = room
    end

    def message
      <<-MSG
#{@room.name}
#{@room.description}

#{exit_list(@room.exits)}
MSG
    end

    private

    def exit_list(exits)
      exits.empty? ? "There are no exits here." : "Exits are: #{exits.keys.join(', ')}"
    end
  end
end
