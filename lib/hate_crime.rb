class HateCrime

  def self.victim_count
    key = "victim_count:all"
    Rails.cache.fetch(key) do
      self.new.victim_count
    end
  end

  def self.victim_count_with_bias(*bias)
    key = "victim_count:bias:#{bias.sort.inject(:+)}"
    Rails.cache.fetch(key) do
      self.new.victim_count_with_bias(bias)
    end
  end

  def self.victim_count_with_offense(*offense)
    key = "victim_count:offense:#{offense.sort.inject(:+)}"
    Rails.cache.fetch(key) do
      self.new.victim_count_with_offense(offense)
    end
  end

  def self.bias_categories
    Rails.cache.fetch("bias_categories") do
      Hatolence::BiasCategory.all.collect { |c| c["name"] }
    end
  end

  def self.biases
    Rails.cache.fetch("bias") do
      Hatolence::Bias.all.collect { |c| c["name"] }
    end
  end

  def self.offense_categories
    Rails.cache.fetch("offense_categories") do
      Hatolence::OffenseCategory.all.collect { |c| c["name"] }
    end
  end

  def self.offenses
    Rails.cache.fetch("offenses") do
      Hatolence::Offense.all.collect { |c| c["name"] }
    end
  end

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

  private

  def total(victim_counts)
    victim_counts.inject(0) do |sum, victim_count|
      sum += victim_count["total"]
    end
  end
end
