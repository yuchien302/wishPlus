class Wish < ActiveRecord::Base
  attr_accessible :story_id, :user_id, :type, :name, :description
  belongs_to :story
  belongs_to :user
  # def self.subclasses
  #   [PhotoWish, TextWish]
  # end
end
