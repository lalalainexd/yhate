class Story < ActiveRecord::Base

  attr_accessible :victims

  def self.random
    offset = rand(Story.count)
    Story.first(offset: offset)
  end

  def victim_list
    victims.split(",").collect{|vicitm|vicitm.strip}
  end
end
