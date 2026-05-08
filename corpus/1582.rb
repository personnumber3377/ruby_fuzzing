do
      a = @cls[1, 2, 3, 42]
      a.reject! do
        a.freeze
        true
      end