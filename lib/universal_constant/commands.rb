module UniversalConstant
  module Commands
    def self.process_input(input)
      command, *args = input.split(' ')
      command = command.downcase.to_sym

      if known_command?(command)
       self.send(command_hash[command], *args)
      else
        OpenStruct.new :message => "I don't know the command '#{input}'."
      end
    end

    private

    def self.known_command?(command)
      command_hash.keys.include?(command)
    end

    def self.command_hash
      {
        :look => :look,
        :quit => :quit,
      }
    end

    def self.look(*args)
      RoomPresenter.new($game.player_location)
    end

    def self.quit(*args)
      throw(:exit_game)
    end
  end
end
