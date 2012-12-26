class Wish < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :type, :name, :description, :photo, :remote_photo_url, :videoId, :pid, :user_uid, :username
  belongs_to :story
  belongs_to :user
  has_many :comments
  
end
