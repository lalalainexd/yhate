class Story < ActiveRecord::Base

  attr_accessible :victims, :title, :link, :description, :bias, :offense,
    :occurred_at

  validates_presence_of :victims, :title, :link, :description, :bias, :offense, :occurred_at

  validates :link, url: true, allow_nil: false, allow_blank: false

  validates :description, length: {maximum: 500}
  validates :title, length: {maximum: 50}

  def self.random(bias:nil, offense:nil)
    arel = if bias
      where(bias: bias)
    elsif offense
      where(offense: offense)
    else
      scoped
    end

    arel.first(offset: rand(arel.count))
  end

  def victim_list
    victims.split(",").collect{|vicitm|vicitm.strip}
  end



end
