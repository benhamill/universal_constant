module UniversalConstant
  module Commands
    def self.look
      result = OpenStruct.new :message => Game.player_location.description
    end
  end
end
