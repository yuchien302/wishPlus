class ParticipationsController < ApplicationController
  respond_to :json

  def index
    @participations = Participation.where(story_id: params[:story_id])
    # story = Story.find(params[:story_id])
    # respond_with story.participations
  end

  def show
    @participation = Participation.where(story_id: params[:story_id], id: params[:id])
    # respond_with Participation.find(params[:id])
  end

  def create
    
    @story = Story.find(params["story_id"])
    @user = User.from_invited(params["user"])
    
    @participation = Participation.where({ story_id: @story.id, user_id: @user.id }).first_or_initialize.tap do |p|
      p.user = @user
      p.story = @story
      p.save!
    end
    
    respond_with( @story, @participation )

  end

  # def update
  #   respond_with Participation.update(params[:id], params[:participation])
  # end

  def destroy
    respond_with Participation.destroy(params[:id])
  end
end