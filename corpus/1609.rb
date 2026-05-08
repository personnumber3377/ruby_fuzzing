do
      a = @cls[1, 2, 3, 42]
      a.select! do
        a.freeze
        false
      end