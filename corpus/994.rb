do
      h.reject! do
        h.freeze
        true
      end