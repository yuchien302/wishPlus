class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid, :cards, :picture
  has_many :participations, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :stories, through: :participations
  has_many :cards, class_name: :Story, foreign_key: :star_id


  def self.from_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.picture = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.from_invited(params)

    where(params.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = params[:provider]
      user.uid = params[:uid]
      user.name = params[:name]
      user.picture = params[:picture]
      user.save!
    end
  end

  
end
