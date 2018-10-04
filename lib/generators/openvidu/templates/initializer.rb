# You need to especify the url where openvidu rest server is hosted and you secret key

Openvidu::Settings.configure do |config|
  config.api_url = 'your openvidu url'
  config.api_key = 'your openvidu secret'
end