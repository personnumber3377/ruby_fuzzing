dom_number_float
      101.times do
        v = @it.random_number
        assert_in_range(0.0...1.0, v)
      end