module UniversalConstant
  class GameSerializer
    attr_reader :game, :save_root

    def initialize(game, path)
      @game = game
      @save_root = File.join(path, @game.name.downcase.gsub(/[^a-z0-9\-_ ]/, '').gsub(/ +/, '_'))
    end
  end
end
