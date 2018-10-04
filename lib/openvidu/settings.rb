module Openvidu
  class Setting
    extend Dry::Configurable

    setting :api_url, read: true
    setting :api_key, read: true
    setting :openvidu_user, 'OPENVIDUAPP'

  end
end