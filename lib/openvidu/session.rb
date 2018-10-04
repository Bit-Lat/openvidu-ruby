module Openvidu

  class Session

    attr_accessor :id, :created_at

    def initialize
      @client = Openvidu::Clients::Session.new
    end

    def self.create(opts = {})
      @client = Openvidu::Clients::Session.new
      valid_opts = [ :media_mode, :recording_mode, :default_recording_layout, :custom_session_id ]

      opts = opts.inject({}) do |m,(k,v)|
        if valid_opts.include? k.to_sym
          m[k.to_sym] = v
        end
        m
      end
      raise Openvidu::OpenviduArgumentError, "media mode must be either routed or relayed" if !opts[:media_mode].nil? && !Openvidu::Constants::MEDIA_MODES.include?(opts[:media_mode].to_sym)
      raise Openvidu::OpenviduArgumentError, "recording mode must be either always or custom" unless opts[:recording_mode].nil? || Openvidu::Constants::RECORDING_MODES.include?(opts[:recording_mode].to_sym)
      response = @client.create(opts)
      session = Openvidu::Session.new
      session.id = response.body[:id]

      session
    end

    def close
      @client.close(@id)
      session
    end

  end

end