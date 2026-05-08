do
      define_method(:bar) do
        x = caller(1, 1)
      end