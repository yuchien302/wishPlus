collection @chats
attributes :story_id, :message, :chat_id

child :user do
  attributes :name, :uid
end