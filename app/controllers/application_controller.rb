class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @story = Story.random(filters)
    @new_story = Story.new

    if params[:bias]
      @total_victims = HateCrime.victim_count_with_bias(*params[:bias])
    elsif params[:offense]
      @total_victims = HateCrime.victim_count_with_offense(*params[:offense])
    else
      @total_victims = HateCrime.victim_count
    end
  end

  private

  def filters
    filter = {bias: params[:bias], offense: params[:offense]}
    filter.keep_if{ |key, value| value != nil }
  end
end
