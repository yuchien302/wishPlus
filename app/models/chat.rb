class Chat < ActiveRecord::Base
  attr_accessible :message, :story_id, :user_id, :useruid, :username
  belongs_to :story
  belongs_to :user
end
