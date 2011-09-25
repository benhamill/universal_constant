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

  after(:each) do
    FileUtils.rm_rf(File.join(SPEC_WORKING_DIR, 'the_game'))
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

  describe "#write_game_data" do
    before(:each) do
      @serializer.create_save_root
      @serializer.write_game_data
    end

    it "creates a file called game in the save root" do
      File.exists?(File.join(@serializer.save_root, 'game')).should be_true
    end

    it "stores high-level game data to the file" do
      File.read(File.join(@serializer.save_root, 'game')).should == YAML.dump({
        'name' => @game.name,
        'start_id' => 0,
      })
    end
  end

  describe "#write_object_data" do
    before(:each) do
      UniversalConstant::GameObject.each do |game_object|
        game_object.stub!(:serialize) { game_object.name }
      end

      @serializer.create_save_root
      @serializer.write_object_data
    end

    it "creates a file called objects in the save root" do
      File.exists?(File.join(@serializer.save_root, 'objects')).should be_true
    end

    it "calls serializers for each Game Object and writes the result" do
      File.read(File.join(@serializer.save_root, 'objects')).should == <<-FILE
Top
Bottom
FILE
    end
  end
end
