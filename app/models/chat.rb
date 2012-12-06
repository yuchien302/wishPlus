class Chat < ActiveRecord::Base
  attr_accessible :message, :story_id, :user_id
  belongs_to :story
  belongs_to :user
end
