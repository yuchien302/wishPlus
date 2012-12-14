OmniAuth.config.logger = Rails.logger


if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '225506477580159', 'b5e4d5f3c8432b3adc4cadfb44f7eb4d', :display => "popup", scope: "email,publish_stream,user_photos,friends_birthday"
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '395021523899984', '28aa89fd73de69a388079f19652466bb', :display => "popup", scope: "email,publish_stream,user_photos,friends_birthday"
  end
end