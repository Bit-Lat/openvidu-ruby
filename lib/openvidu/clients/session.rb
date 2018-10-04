module Openvidu
  module Clients
    class Session < ApiStruct::Client
      openvidu_api: sessions

      def create(**params)
        post(params)
      end

      def find(id)
        get(id)
      end

      def all(params)
        get(params)
      end

    end
  end
end