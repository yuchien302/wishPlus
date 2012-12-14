class Story < ActiveRecord::Base
  attr_accessible :name, :birthday, :users, :star, :star_uid
  has_many :participations, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :users, through: :participations
  belongs_to :star, class_name: :User
  has_many :chats, dependent: :destroy
  accepts_nested_attributes_for :users
  validates :star_uid, :presence => true
  # validates :star, :presence => true

  # def self.create(params)
  #   # story = Story.new
  #   # debugger
  #   star_id = params.delete("star_uid").map { |uid| User.where(uid: uid).id }
  #   puts star_id
  #   Story.create(params)
  # end


  def self.update(id, params)
    user_ids = params.delete("users").map { |u| User.find(u["user_id"]).id }
    # star_id = params.delete("star").map { |s| User.where(uid: s).id }
    puts star_id
    # user_ids = User.where(uid: uids).map { |u| u.id }
    

    # puts "***"
    # puts participations = Participation.where(story_id: 1).map{ |p| p.user_id }
    # puts "***"
    # puts user_ids
    # puts "***"
    # puts (participations - user_ids)
    # puts "***"
    
    # old = story.participations.all

    # puts participations.map { |p| p.id }
    # puts old.map { |e| e.id }
    story = Story.find(id)
    story.update_attributes(params)
    # story
    # super.update(id, params)

  end
end
