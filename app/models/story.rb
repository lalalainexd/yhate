class Story < ActiveRecord::Base

  attr_accessible :victims, :title, :link, :description, :bias, :offense,
    :occurred_at

  validates_presence_of :victims, :title, :link, :description, :bias, :offense, :occurred_at

  def self.random(bias:nil)
    if bias
      arel = where(bias: bias)
      offset = rand(arel.count)
      arel.first(offset: offset)
    else
      offset = rand(Story.count)
      Story.first(offset: offset)
    end
  end

  def victim_list
    victims.split(",").collect{|vicitm|vicitm.strip}
  end

end
