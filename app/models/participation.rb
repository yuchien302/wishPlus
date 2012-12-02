class Participation < ActiveRecord::Base
  attr_accessible :story_id, :user_id
  # validates_uniqueness_of [:story_id, :user_id]
  belongs_to :story
  belongs_to :user

end
