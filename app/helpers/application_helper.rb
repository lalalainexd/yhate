module ApplicationHelper

  def options_for_bias_category
    options = HateCrime.bias_categories
    options.unshift("All")
    options_for_select(options)
  end

  def options_for_bias
    options = HateCrime.biases
    options.unshift("All")
    options_for_select(options)
  end

  def options_for_offense_category
    options = HateCrime.offense_categories
    options.unshift("All")
    options_for_select(options)
  end

  def options_for_offense
    options = HateCrime.offenses
    options.unshift("All")
    options_for_select(options)
  end

  def filters
    {bias: params[:bias],offense: params[:offense]}
  end

  def bias_categories
    HateCrime.bias_categories
  end

  def biases(bias_category)
    HateCrim.biases(bias_category)
  end

end
