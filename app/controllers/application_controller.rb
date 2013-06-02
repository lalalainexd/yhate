class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @story = Story.random(filters)
  end

  def filters
    filter = {bias: params[:bias], offense: params[:offense]}
    filter.keep_if{ |key, value| value != nil }
  end
end
