require 'spec_helper'

describe UniversalConstant::GameSerializer do
  before(:each) do
    clear_object_cache
    @game = UniversalConstant::Game.new(:name => 'The Game', :start_id => 0)
    @top = UniversalConstant::Room.new(:description => 'Up high', :name => 'Top')
    @bottom = @top.dig('Down', 'Bottom', :back => 'Up')
    @bottom.description = 'Down low.'

    @serializer = UniversalConstant::GameSerializer.new(@game, SPEC_WORKING_DIR)
  end

  describe ".new" do
    it "stores a game" do
      @serializer.game.should === @game
    end

    it "calculates where everything will be saved" do
      @serializer.save_root.should == File.join(SPEC_WORKING_DIR, 'the_game')
    end
  end

  describe "#create_save_root" do
    it "creates a directory named after the game" do
      @serializer.create_save_root
      Dir.exists?(@serializer.save_root).should be_true
    end
  end
end
