class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      redirect_to root_path
    else
      render :new
    end
  end
end
