class HateCrime

  def self.victim_count
    self.new.victim_count
  end

  def self.victim_count_with_bias(*bias)
    self.new.victim_count_with_bias(bias)
  end

  def self.victim_count_with_offense(*offense)
    self.new.victim_count_with_offense(offense)
  end

  private

  def victim_count
    victim_counts = Hatolence::VictimCount.all

    total(victim_counts)

  end

  def victim_count_with_bias(bias)
    victim_counts = Hatolence::VictimCount.filter_by_bias(*bias)
    total(victim_counts)
  end

  def victim_count_with_offense(offense)
    victim_counts = Hatolence::VictimCount.filter_by_offense(*offense)
    total(victim_counts)
  end



  def total(victim_counts)
    victim_counts.inject(0) do |sum, victim_count|
      sum += victim_count["total"]
    end
  end
end
