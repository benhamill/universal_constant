require 'spec_helper'

describe UniversalConstant::GameSerializer do
  describe ".new" do
    before(:each) do
      @game = UniversalConstant::Game.new(:name => 'The Game', :start_id => 0)
      @serializer = UniversalConstant::GameSerializer.new(@game, SPEC_WORKING_DIR)
    end

    it "stores a game" do
      @serializer.game.should === @game
    end

    it "calculates where everything will be saved" do
      @serializer.save_root.should == File.join(SPEC_WORKING_DIR, 'the_game')
    end
  end
end
