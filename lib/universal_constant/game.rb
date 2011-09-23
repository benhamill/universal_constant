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
end
