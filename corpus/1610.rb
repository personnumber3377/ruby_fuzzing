do
      a = @cls[1, 2, 3, 42]
      a.keep_if do
        a.freeze
        false
      end