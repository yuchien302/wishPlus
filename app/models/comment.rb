class Comment < ActiveRecord::Base
  attr_accessible :content, :wish_id
  belongs_to :wish
end
