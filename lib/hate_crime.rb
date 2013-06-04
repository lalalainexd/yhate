class HateCrime

  def self.victim_count
    victim_counts = Hatolence::VictimCount.all

    total(victim_counts)

  end

  def self.victim_count_with_bias(*bias)
    victim_counts = Hatolence::VictimCount.filter_by_bias(*bias)
    total(victim_counts)
  end

  def self.victim_count_with_offense(*offense)
    victim_counts = Hatolence::VictimCount.filter_by_offense(*offense)
    total(victim_counts)
  end

  private

  def self.total(victim_counts)
    victim_counts.inject(0) do |sum, victim_count|
      sum += victim_count["total"]
    end
  end
end
