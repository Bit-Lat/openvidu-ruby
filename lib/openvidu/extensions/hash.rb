module Openvidu
  module HashExtensions

    def camelize_keys
      newHash = deep_transform_keys do |k|
        str = k.to_s
        str.extend(Openvidu::StringExtensions)
        str.to_s.camelize(false)
      end
      newHash
    end

    def deep_transform_keys(&block)
      result = {}
      each do |key, value|
        result[yield(key)] = value.is_a?(Hash) ? value.deep_transform_keys(&block) : value
      end
      result
    end
  end
end