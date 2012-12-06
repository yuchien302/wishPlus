class ChatsController < ApplicationController
  respond_to :json

  def index
    @chats = Chat.where(story_id: params[:story_id], user_id: current_user.id)

    respond_with @chats || ""
  end

  def show
    @chat = Chat.where(story_id: params[:story_id], id: params[:id])
    @story = Story.find(params[:story_id])
    respond_with @story, @chat
  end

  def create
    # debugger
    @story = Story.find(params[:story_id])
    @chat = Chat.create(params[:chat])

    @chat.user = current_user
    @chat.save!
    respond_with  @story, @chat

  end

  def update
    respond_with Chat.update(params[:id], params[:chat])
  end

  def destroy
    respond_with Chat.destroy(params[:id])
  end
end