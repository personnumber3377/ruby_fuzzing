dom_number_not_default
      msg = "random_number should not be affected by srand"
      seed = srand(0)
      x = @it.random_number(1000)
      10.times do|i|
        srand(0)
        return unless @it.random_number(1000) == x
      end