class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    story = Story.find(params[:story_id])
    @users = story.users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
    end
  end

end
