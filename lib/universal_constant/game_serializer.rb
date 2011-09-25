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

    def write_game_data
      File.open(File.join(save_root, 'game'), 'w') do |file|
        file.puts YAML.dump({
          'name' => game.name,
          'start_id' => game.starting_location.id,
        })
      end
    end

    def write_object_data
      File.open(File.join(save_root, 'objects'), 'w') do |file|
        GameObject.each do |go|
          file.puts go.serialize
        end
      end
    end
  end
end
