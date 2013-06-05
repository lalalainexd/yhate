module ApplicationHelper

  def options_for_bias_category
    options = HateCrime.bias_categories
    options_for_select(options)
  end

  def options_for_bias
    options = HateCrime.biases
    options_for_select(options)
  end

  def options_for_offense_category
    options = HateCrime.offense_categories
    options_for_select(options)
  end

  def options_for_offense
    options = HateCrime.offenses
    options_for_select(options)
  end

  def filters
    {bias: params[:bias],offense: params[:offense]}
  end

end
