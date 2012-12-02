class StoriesController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.stories
  end

  def show
    @story = Story.find(params[:id])
    @users = @story.users
  end

  def create
    @story = Story.create(params[:story])
    Participation.create({story_id: @story.id, user_id: current_user.id})
    respond_with @story
  end

  def update
    respond_with Story.update(params[:id], params[:story])
  end

  def destroy
    respond_with Story.destroy(params[:id])
  end
end