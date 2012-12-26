class StoriesController < ApplicationController
  respond_to :json

  def index
    @stories = current_user.stories + current_user.cards
    # respond_with current_user.stories || ""
  end

  def show
    @story = Story.find(params[:id])
    @users = @story.users
  end

  def create
    @story = Story.create(params[:story])
    star_uid = params[:star_uid]
    star = User.from_invited({:uid => star_uid, :provider => "facebook", 
          :picture => params[:picture], :name => params[:star_name]})
    Participation.create({story_id: @story.id, user_id: current_user.id})
    @story.star = star
    @story.save!
    respond_with @story
  end

  def update
    respond_with Story.update(params[:id], params[:story])
  end

  def destroy
    respond_with Story.destroy(params[:id])
  end
end