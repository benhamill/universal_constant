class Hash
  def symbolize_keys
    inject({}) do |options, (key, value)|
      if key.respond_to?(:to_sym)
        key = key.to_sym
        value = value.symbolize_keys if value.respond_to?(:symbolize_keys)

        options[key] = value
      end

      options
    end
  end

  def symbolize_keys!
    self.replace(self.symbolize_keys)
  end
end
