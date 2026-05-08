do
      h.delete_if do
        h.freeze
        true
      end