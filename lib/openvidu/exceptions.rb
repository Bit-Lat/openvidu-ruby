module Openvidu
  class OpenviduError < StandardError; end
  class OpenviduAuthenticationError < OpenviduError; end
  class OpenviduArgumentError < OpenviduError; end
end