class StoriesController < ApplicationController
  respond_to :json

  def create
    @new_story = Story.new(params[:story])

    @new_story.save

    respond_with @new_story
  end
end
