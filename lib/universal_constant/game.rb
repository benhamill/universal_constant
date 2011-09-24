require_relative 'game/ui'

module UniversalConstant
  class Game
    include UI

    attr_reader :player, :starting_location, :name

    def initialize(options = {})
      options = default_options.merge!(options.symbolize_keys!)

      @name = options[:name].to_s
      @player = Player.new
      @starting_location = GameObject.find(options[:start_id].to_i)
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

    private

    def default_options
      {
        :start_id => 0,
        :name => 'new game',
      }
    end
  end
end
