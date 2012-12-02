collection @participations
attributes :user_id, :story_id, :id

child :user do
  attributes :name, :uid, :id, :provider
end

child :story do
  attributes :name, :description
end
