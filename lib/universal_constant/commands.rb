module UniversalConstant
  module Commands
    def self.look(*args)
      OpenStruct.new :message => Game.player_location.description
    end

    def self.method_missing(method_name, *args, &block)
      OpenStruct.new :message => "I don't know the command #{method_name}."
    end
  end
end
