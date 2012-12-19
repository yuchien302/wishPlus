class MainPagesController < ApplicationController
  def welcome
    
    redirect_to user_path(current_user.id) if current_user
  end

  def home
  end

  def help
  end

  def story
  end

  def friends
    
  end

end
