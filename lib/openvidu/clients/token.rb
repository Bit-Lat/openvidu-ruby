module Openvidu
  module Clients
    class Token
      def initialize
        @client = Openvidu::Clients::Client.new
      end

      def create(options = {})
        options.extend(Openvidu::HashExtensions)
        params = options.camelize_keys
        response = @client.post do |req|
          req.url '/api/tokens'
          req.headers['Content-Type'] = 'application/json'
          req.body = options.to_json
        end
        case response.status
        when (200..300)
          response
        when 400
          raise Openvidu::OpenviduArgumentError, "problem with body parameters"
        else
          raise Openvidu::OpenviduError, "Failed to create token. Response code: #{response.code}"
        end
      rescue StandardError => e
        raise Openvidu::OpenviduError, "Failed to connect to Openvidu. Response code: #{e.message}"
      end
    end
  end
end