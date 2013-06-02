module ApplicationHelper

  def options_for_bias_category
    categories = Hatolence::BiasCategory.all
    options = categories.collect{|c|[c["name"], c["name"]]}
    options_for_select(options)
  end

  def options_for_bias
    categories = Hatolence::Bias.all
    options = categories.collect{|c|[c["name"], c["name"]]}
    options_for_select(options)
  end

  def options_for_offense_category
    categories = Hatolence::OffenseCategory.all
    options = categories.collect{|c|[c["name"], c["name"]]}
    options_for_select(options)
  end

  def options_for_offense
    categories = Hatolence::Offense.all
    options = categories.collect{|c|[c["name"], c["name"]]}
    options_for_select(options)
  end

  def filters
    {bias: params[:bias],offense: params[:offense]}
  end

end
