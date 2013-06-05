require 'hatolence'
require './lib/hate_crime'

describe HateCrime do

  describe "victim_count_with_bias" do
    let(:victim_counts) do
      [
        {
          "total" => 1,
          #"bias" => {
            #"name" => "cat"
          #},
          #"offense" => {
            #"name" => "poked"
          #}
        },
        {
          "total" => 2
          #"bias" => {
            #"name" => "cat"
          #},
          #"offense" => {
            #"name" => "dropped"
          #}
        }
      ]
    end

    context "filter by 1 bias" do
      it "returns the victim count" do
        Hatolence::VictimCount.should_receive(:filter_by_bias).with("cat").and_return(victim_counts)
        expect(HateCrime.victim_count_with_bias("cat")).to eq(3)
      end
    end

    context "bias doesn't exist" do
      it "returns 0" do
        Hatolence::VictimCount.should_receive(:filter_by_bias).with("chimp").and_return([])
        expect(HateCrime.victim_count_with_bias("chimp")).to eq(0)
      end
    end

    context "multiple biases" do
      it "returns the victim count" do
        turtle = {
          "total" => 2,
          "bias" => {
            "name" => "turtle"
          },
          "offense" => {
            "name" => "dropped"
          }
        }
        victim_counts << turtle
        Hatolence::VictimCount.should_receive(:filter_by_bias).with("turtle", "cat").and_return(victim_counts)
        expect(HateCrime.victim_count_with_bias("turtle", "cat")).to eq(5)
      end
    end

  end

  describe "victim_count_with_offense" do
    let(:victim_counts) do
      [
        {
          "total" => 2,
          "bias" => {
            "name" => "turtle"
          },
          "offense" => {
            "name" => "dropped"
          }
        },
        {
          "total" => 2,
          "bias" => {
            "name" => "cat"
          },
          "offense" => {
            "name" => "dropped"
          }
        }
      ]
    end

    context "filter by 1 offense" do
      it "returns the victim count" do
        Hatolence::VictimCount.should_receive(:filter_by_offense).with("dropped").and_return(victim_counts)
        expect(HateCrime.victim_count_with_offense("dropped")).to eq(4)
      end
    end

    context "bias doesn't exist" do
      it "returns 0" do
        Hatolence::VictimCount.should_receive(:filter_by_offense).with("blah").and_return([])
        expect(HateCrime.victim_count_with_offense("blah")).to eq(0)
      end
    end

    context "multiple biases" do
      it "returns the victim count" do
        poked = {
          "total" => 1,
          "bias" => {
            "name" => "cat"
          },
          "offense" => {
            "name" => "poked"
          }
        }
        victim_counts << poked
        Hatolence::VictimCount.should_receive(:filter_by_offense).with("dropped", "poked").and_return(victim_counts)
        expect(HateCrime.victim_count_with_offense("dropped", "poked")).to eq(5)
      end
    end

  end

  describe ".total_victims" do
    let(:victim_counts) do
      [
        {
          "total" => 1,
          "bias" => {
            "name" => "cat"
          },
          "offense" => {
            "name" => "poked"
          }
        },
        {
          "total" => 2,
          "bias" => {
            "name" => "turtle"
          },
          "offense" => {
            "name" => "dropped"
          }
        },
        {
          "total" => 2,
          "bias" => {
            "name" => "cat"
          },
          "offense" => {
            "name" => "dropped"
          }
        }
      ]
    end

    it "returns the total number of vicitms" do

    Hatolence::VictimCount.should_receive(:all).and_return(victim_counts)

    expect(HateCrime.victim_count).to eq(5)

    end
  end

end

