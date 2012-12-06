class Wish < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :type, :name, :description, :photo, :remote_photo_url
  belongs_to :story
  belongs_to :user
  
end
