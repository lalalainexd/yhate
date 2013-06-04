require 'spec_helper'

describe Story do

  describe '.random' do
    it 'returns a random story from the database' do
      5.times{ FactoryGirl.create(:cat_bias_story)}

      story1 = Story.random
      story2 = Story.random
      story3 = Story.random

      not_equal = story1 != story2 || story1 != story3 || story2 != story3

      expect(not_equal).to be_true

    end

    context 'with optional parameters' do

      let!(:story1) { FactoryGirl.create(:cat_bias_story) }
      let!(:story2) { FactoryGirl.create(:cat_bias_story) }
      let!(:story3) { FactoryGirl.create(:dog_bias_story) }
      let!(:story4) { FactoryGirl.create(:sheep_bias_story) }

      it 'returns a random story that fits the bias categories' do
        random_story = Story.random(bias: ["cat"])

        expect([story1, story2]).to include(random_story)

      end

      it "returns a random sotry that fits any of the listed biases" do
        random_story = Story.random(bias: ["cat", "dog"])

        expect([story1, story2, story3]).to include(random_story)

      end

      it "returns a random sotry that fits any of the listed offense" do
        random_story = Story.random(offense: ["sheered", "thrown"])

        expect([story1, story2, story4]).to include(random_story)

      end
    end
  end

  describe "#victim_list" do
    it "returns a collection of the vicitims" do
      story = Story.new(victims: "Hello Kitty, Goat, Spongebob")
      expect(story.victim_list).to match_array(["Hello Kitty", "Goat", "Spongebob"])
    end
  end

  describe "date validation" do

    context "invalid date format" do
      it "is invalid" do
        story = FactoryGirl.build(:cat_bias_story)
        story.occurred_at = "blah"
        expect(story).to be_invalid
      end
    end
  end

end
