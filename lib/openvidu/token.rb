module Openvidu
  class Token
    attr_accessor :token, :session, :role, :data, :id, :kurento_options

    def self.create(opts = {})
      @client = Openvidu::Clients::Token.new
      valid_opts = [ :session, :role, :kurento_options, :custom_session_id ]
      opts = opts.inject({}) do |m,(k,v)|
        if valid_opts.include? k.to_sym
          m[k.to_sym] = v
        end
        m
      end
      raise Openvidu::OpenviduArgumentError, "session id is required" if opts[:session].nil?
      raise Openvidu::OpenviduArgumentError, "role mode must be either subscriber, publisher or moderator" unless opts[:role].nil? || Openvidu::Constants::ROLES.include?(opts[:role].to_sym)
      response = @client.create(opts)
      token = Openvidu::Token.new
      token.id = response.body[:id]
      token.token = response.body[:token]
      token.role = response.body[:role]
      token.data = response.body[:data]
      token.kurento_options = response.body[:kurento_options]
      token
    end

  end
end