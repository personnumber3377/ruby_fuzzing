dom_number_float_by_zero
      101.times do
        v = @it.random_number(0)
        assert_in_range(0.0...1.0, v)
      end