class Photowish < Wish

  attr_accessible :name, :photo, :remote_photo_url, :user_uid, :username
  mount_uploader :photo, PhotoUploader

end