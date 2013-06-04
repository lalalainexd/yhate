require 'spec_helper'

describe ApplicationController do
  describe "#index" do
    context "witout a filter" do

      it "includes the total victim count and get a random story" do
        Story.should_receive(:random)
        HateCrime.should_receive(:victim_count).and_return(3)
        get :index
        expect(assigns(:total_victims)).to eq(3)
      end
    end

    context "with a filter" do
      it "gets a random story that fits one of the biases and the victim count" do
        Story.should_receive(:random).with(bias:["cat", "dog"])
        HateCrime.should_receive(:victim_count_filter_by_bias).with("cat", "dog").and_return(2)
        get :index, bias:["cat", "dog"]
        expect(assigns(:total_victims)).to eq(2)
      end

      it "gets a random story that fits one of the offenses" do
        Story.should_receive(:random).with(offense:["person", "property"])
        HateCrime.should_receive(:victim_count_filter_by_offense).with("person", "property").and_return(1)
        get :index, offense:["person", "property"]
        expect(assigns(:total_victims)).to eq(1)
      end

    end

  end
end
