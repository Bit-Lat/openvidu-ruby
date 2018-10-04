module Openvidu
  module ValidateOptions
    def self.validate_options!(params, options)
      options[:optional] ||= []
      options[:required] ||= []
      params = params.deep_symbolize_keys
      params.assert_required_keys(options[:required])
      params.assert_valid_keys(options[:required] + options[:optional])
    end
  end
end