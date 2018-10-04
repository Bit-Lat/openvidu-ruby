module Openvidu
  module Clients
    class Client
      attr_reader :api_key
      attr_reader :openvidu_user
      attr_reader :base_url
      attr_reader :conn

      def initialize
        @base_url = Openvidu::Settings.config.api_url
        @api_key = Openvidu::Settings.config.api_key
        @openvidu_user = Openvidu::Settings.config.openvidu_user
        @conn = Faraday.new(url: @base_url, headers: {
          'Content-Type' => 'application/json'
        }) do |conn|
          conn.basic_auth(@openvidu_user, @api_key)
          conn.use :instrumentation
          conn.response :json, :content_type => /\bjson$/, :parser_options => { :symbolize_names => true }
          conn.response :raise_error
          conn.adapter  Faraday.default_adapter
        end
      end

      def get(*args, &block)
        @conn.get *args, &block
      end

      def delete(*args, &block)
        @conn.delete *args, &block
      end

      def post(*args, &block)
        @conn.post *args, &block
      end

      def put(*args, &block)
        @conn.put *args, &block
      end

    end
  end

end