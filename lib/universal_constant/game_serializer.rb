module UniversalConstant
  class GameSerializer
    attr_reader :game, :save_root

    def initialize(game, path)
      @game = game
      @save_root = File.join(path, @game.name.downcase.gsub(/[^a-z0-9\-_ ]/, '').gsub(/ +/, '_'))
    end

    def create_save_root
      FileUtils.mkdir(save_root)
    end
  end
end
