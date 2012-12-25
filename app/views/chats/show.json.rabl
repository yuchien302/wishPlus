object @chat
attributes :story_id, :message, :chat_id

child :user do
  attributes :name, :uid
end