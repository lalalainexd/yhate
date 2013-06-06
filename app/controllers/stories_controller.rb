class StoriesController < ApplicationController
  respond_to :json
  before_filter :clean_occurred_at

  def create
    @new_story = Story.new(params[:story])

    @new_story.save

    respond_with @new_story
  end

  private

  def clean_occurred_at
    time = Chronic.parse(params[:story][:occurred_at])
    params[:story][:occurred_at] = time
  end
end
