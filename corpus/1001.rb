do
      h.filter! do
        h.freeze
        false
      end