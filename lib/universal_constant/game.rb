require_relative 'game/ui'

module UniversalConstant
  class Game
    include UI

    attr_reader :player, :starting_location

    def initialize(starting_location_id = 0)
      @player = Player.new
      @starting_location = GameObject.find(starting_location_id)
    end

    def player_location
      @player.location
    end

    def move_player_to(room)
      @player.location = room
    end

    def start
      catch(:exit_game) do
        $game = self
        @player.location = @starting_location
        response = Commands.look

        loop do
          say response.message
          response = Commands.process_input(ask)
        end
      end
    end
  end
end
