class Photowish < Wish

  attr_accessible :name, :photo, :remote_photo_url, :useruid, :username
  mount_uploader :photo, PhotoUploader

end