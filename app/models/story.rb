class Story < ActiveRecord::Base
  attr_accessible :description, :ended_at, :name, :started_at, :users
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  accepts_nested_attributes_for :users
  validates :name, :presence => true

  def self.update(id, params)
    user_ids = params.delete("users").map { |u| User.find(u["user_id"]).id }
    
    puts user_ids
    # user_ids = User.where(uid: uids).map { |u| u.id }
    

    puts "***"
    puts participations = Participation.where(story_id: 1).map{ |p| p.user_id }
    puts "***"
    puts user_ids
    puts "***"
    puts (participations - user_ids)
    puts "***"
    
    # old = story.participations.all

    # puts participations.map { |p| p.id }
    # puts old.map { |e| e.id }
    story = Story.find(id)
    story.update_attributes(params)
    # story
    # super.update(id, params)

  end
end
