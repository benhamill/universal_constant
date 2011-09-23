require 'spec_helper'

describe UniversalConstant::GameObject do
  describe ".find" do
    it "gets an object with the given id" do
      clear_object_cache
      5.times { UniversalConstant::GameObject.new }
      g = UniversalConstant::GameObject.new
      5.times { UniversalConstant::GameObject.new }

      UniversalConstant::GameObject.find(5).should === g
    end
  end

  describe ".new" do
    it "assigns a sequential id to each new object" do
      clear_object_cache
      first_id = UniversalConstant::GameObject.new.id
      second_id = UniversalConstant::GameObject.new.id

      first_id.should == 0
      second_id.should == 1
    end

    it "assigns hash values to instance variables matching the hash keys" do
      go = UniversalConstant::GameObject.new(:name => 'Steve', :class => 'awesome')

      go.instance_variable_get(:@name).should == 'Steve'
      go.instance_variable_get(:@class).should == 'awesome'
    end
  end
end
