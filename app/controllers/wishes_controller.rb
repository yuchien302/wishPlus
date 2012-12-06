class WishesController < ApplicationController
  respond_to :json

  def index
    @wishes = Wish.where(story_id: params[:story_id], user_id: current_user.id)

    respond_with @wishes || ""
  end

  def show
    @wish = Wish.where(story_id: params[:story_id], id: params[:id])
    @story = Story.find(params[:story_id])
    respond_with @story, @wish
  end

  def create
    # debugger
    @story = Story.find(params[:story_id])

    if params[:type] == "Photowish"
      # debugger
      @wish = Photowish.new()
      @wish.photo = params[:photo] || params[:remote_photo_url]
      
    else
      @wish = Wish.new()
    end

    @wish.type = params[:type]
    @wish.story = @story
    @wish.user = current_user
    @wish.save!
    respond_with  @story, @wish

  end

  def update
    respond_with Wish.update(params[:id], params[:wish])
  end

  def destroy
    respond_with Wish.destroy(params[:id])
  end
end