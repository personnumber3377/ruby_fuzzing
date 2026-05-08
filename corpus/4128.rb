dom_number_int
      101.times do |idx|
        next if idx.zero?
        v = @it.random_number(idx)
        assert_in_range(0...idx, v)
      end