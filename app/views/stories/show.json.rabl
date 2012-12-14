object @story
attributes :id, :name, :birthday, :star_uid

child :star => :star do
  attributes :name, :uid, :picture
end