require 'dry-configurable'

module Openvidu
  class Settings
    extend Dry::Configurable

    setting :api_url
    setting :api_key
    setting :openvidu_user, 'OPENVIDUAPP'

  end
end