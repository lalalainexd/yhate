class StoriesController < ApplicationController

  def index
    @story = Story.random
  end
end
