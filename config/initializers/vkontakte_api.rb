VkontakteApi.configure do |config|
  config.app_id       = ENV['VK_API_APP_ID']
  config.app_secret   = ENV['VK_API_APP_SECRET']
  config.redirect_uri = 'https://oauth.vk.com/blank.html'

  # используемая версия API
  config.api_version = '5.40'
end