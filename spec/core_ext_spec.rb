require 'spec_helper'

describe "Hash" do
  describe "#symbolize_keys" do
    it "turns strings into symbols" do
      hash = {'series' => 'Yeah', 'level' => 'Easy'}
      hash.symbolize_keys.should == {series: 'Yeah', level: 'Easy'}
    end

    it "isn't destructive" do
      hash = {'series' => 'Yeah', 'level' => 'Easy'}
      hash.symbolize_keys
      hash.should == {'series' => 'Yeah', 'level' => 'Easy'}
    end

    it "keeps symbol keys" do
      hash = {'series' => 'Yeah', level: 'Easy'}
      hash.symbolize_keys.should == {series: 'Yeah', level: 'Easy'}
    end

    it "throws away keys it can't convert" do
      hash = {series: 'Yeah', [] => 14}
      hash.symbolize_keys.should == {series: 'Yeah'}
    end
  end
end
