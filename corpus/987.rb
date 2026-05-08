do
      h.keep_if do
        h.freeze
        false
      end