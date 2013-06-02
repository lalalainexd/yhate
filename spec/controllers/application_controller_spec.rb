require 'spec_helper'

describe ApplicationController do
  describe "#index" do
    it "gets a single random story" do
      Story.should_receive(:random)
      get :index
    end

    context "with a filter" do
      it "gets a random story that fits one of the biases" do
        Story.should_receive(:random).with(bias:["cat", "dog"])
        get :index, bias:["cat", "dog"]
      end

      it "gets a random story that fits one of the offenses" do
        Story.should_receive(:random).with(offense:["person"])
        get :index, offense:["person"]
      end

    end

  end
end
