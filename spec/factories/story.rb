FactoryGirl.define do
  factory :cat_bias_story, class: "Story" do
    occurred_at DateTime.now
    victims "Hello Kitty, Mom Cat"
    description "Cat thrown out the window"
    link "http://www.example.com"
    title "Poor Kitties"
    bias "cat"
  end

  factory :dog_bias_story, class: "Story" do
    occurred_at DateTime.now
    victims "Pochacco"
    description "Kicked in the butt"
    link "http://www.example.com"
    title "Abused puppy"
    bias "dog"
  end

  factory :sheep_bias_story, class: "Story" do
    occurred_at DateTime.now
    victims "Black sheep"
    description "Sheered"
    link "http://www.example.com"
    title "Bah bah naked sheep"
    bias "sheep"
  end
end
