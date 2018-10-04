module Openvidu
  module Constants
    MEDIA_MODES = Set.new([:routed, :relayed])
    RECORDING_MODES = Set.new([:always, :custom])
    ROLES = Set.new([:subscriber, :publisher, :moderator])
  end
end