do
      a = @cls[1, 2, 3, 42]
      a.delete_if do
        a.freeze
        true
      end