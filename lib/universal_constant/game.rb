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

    def start
      catch(:exit_game) do
        @player.location = @starting_location
        response = Commands.look

        loop do
          say response.message
          command, *args = ask

          response = Commands.send(command, *args)
        end
      end
    end
  end
end
