do
        def foo(*args)
          tap do
            return super(:ref, *args)
          end