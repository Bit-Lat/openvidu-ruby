module Openvidu
  class Auth
    attr_reader :user, :password

    def self.call
      new.call
    end

    def initialize
      @user, @password = Openvidu::Settings.config.openvidu_user, Openvidu::Settings.config.api_key
    end

    def call
      generate_basic_auth_string
    end

    def generate_basic_auth_string
      "Basic #{credentials}"
    end

    def credentials
      Base64.encode64("#{@user}:#{@password}")
    end

  end
end
