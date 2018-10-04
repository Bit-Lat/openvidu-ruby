require "openvidu/exceptions"
require "openvidu/hash"
require "openvidu/validate_options"

module Openvidu
  class Client
    include ValidateOptions
    attr_reader :api_key, :openvidu_user, :base_url, :conn

    def initialize(api_url:, api_key:, openvidu_user: 'OPENVIDUAPP')
      @openvidu_user = config[:api_user] || 'OPENVIDUAPP'
      @api_key = config[:api_key]
      @base_url = config[:url]
      @conn = Faraday.new(url: @base_url, headers: {'Content-Type' => 'application/json'}) do |conn|
        conn.request :json
        conn.adapter :httpclient
        conn.response :raise_error
        conn.basic_auth(@openvidu_user, @api_key)
      end

      def create_session(options = {})

        validate_options!(options,
          required: []
          optional: [:media_mode, :recording_mode, :default_recording_layout, :custom_session_id],
          )

        response = @conn.post('/api/sessions', options)
        case response.status
        when 200..300
          response
        when 403
          raise OpenviduAuthenticationError, "Authentication failed when creating a session. Response code: #{response.status}"
        else
          raise OpenviduError, "Failed to create a session. Response code: #{response.status}"
        end
      rescue StandardError => e
        raise OpenviduError, "Failed to connect to openvidu server. Response code: #{response.status}"
      end
    end
  end