module Openvidu
  class Session < ApiStruct::Entity

    client_service Openvidu::Clients::Session

    attr_entity :id

  end
end