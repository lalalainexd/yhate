require 'spec_helper'

describe Story do

  describe '.random' do
    it 'returns a random story from the database' do
      5.times{ Story.create}

      story1 = Story.random
      story2 = Story.random
      story3 = Story.random

      not_equal = story1 != story2 || story1 != story3 || story2 != story3

      expect(not_equal).to be_true

    end
  end

  describe "#victim_list" do
    it "returns a collection of the vicitims" do
      story = Story.new(victims: "Hello Kitty, Goat, Spongebob")

      expect(story.victim_list).to match_array(["Hello Kitty", "Goat", "Spongebob"])
    end
  end
end
