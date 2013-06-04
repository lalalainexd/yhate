class Story < ActiveRecord::Base

  attr_accessible :victims, :title, :link, :description, :bias, :offense,
    :occurred_at

  validates_presence_of :victims, :title, :link, :description, :bias, :offense, :occurred_at

  validates :link, url: true, allow_nil: false, allow_blank: false

  def self.random(bias:nil, offense:nil)
    #TDOO ew this .... ew..
    if bias
      arel = where(bias: bias)
      offset = rand(arel.count)
      arel.first(offset: offset)
    elsif offense
      arel = where(offense: offense)
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
