module Openvidu
  module Clients
    class Session

      def initialize
        @client = Openvidu::Clients::Client.new
      end

      def create(options = {})
        options.extend(Openvidu::HashExtensions)
        params = options.camelize_keys
        response = @client.post do |req|
          req.url '/api/sessions'
          req.headers['Content-Type'] = 'application/json'
          req.body = options.to_json
        end
        case response.status
        when (200..300)
          response
        when 400
          raise Openvidu::OpenviduArgumentError, "problem with body parameters"
        when 409
          raise Openvidu::OpenviduError, "parameter customSessionId corresponds to an existing session."
        when 403
          raise Openvidu::OpenviduAuthenticationError, "Authentication failed while creating a session"
        else
          raise Openvidu::OpenviduError, "Failed to create session. Response code: #{response.code}"
        end
      rescue StandardError => e
        raise Openvidu::OpenviduError, "Failed to connect to Openvidu. Response code: #{e.message}"
      end

      def find(id)
        get(id)
      end

      def index(params)
        get(params)
      end

      def close(id)
        response = @client.delete do
          req.url "/api/sessions/#{id}"
        end
        case response.status
        when (200..300)
          response
        when 404
          raise Openvidu::OpenviduError, "no session exists for the passed SESSION_ID"
        else
          raise Openvidu::OpenviduError, "Failed to close session. Response code: #{response.code}"
        end
      end

    end
  end
end