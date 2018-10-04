module Openvidu
  class Hash
    def assert_required_keys(*keys)
      keys.flatten.each do |key|
        raise OpenviduArgumentError.new("Required key: #{key.inspect}") unless has_key?(key)
      end
    end

    def camelize_keys!
      keys.each do |k|
        new_key = k.to_s.camelize(:lower)
        new_key = new_key.to_sym if k.is_a? Symbol
        self[new_key] = self.delete(k)
      end
      self
    end
  end
end