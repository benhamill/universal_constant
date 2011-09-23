require_relative 'game/ui'

class UniversalConstant::Game
  include UI

  attr_reader :player

  def initialize
    @player = UniversalConstant::Player.new
  end

  def player_location
    @player.location
  end

  def starting_location
    i = 0

    catch(:found_room) do
      loop do
        obj = UniversalConstant::GameObject.find(i)
        throw :found_room, obj if obj.is_a?(UniversalConstant::Room)
        i += 1
      end
    end
  end
end
