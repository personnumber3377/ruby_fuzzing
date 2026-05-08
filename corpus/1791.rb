do |n|
      (-64..64).each do |idx|
        assert_equal((n >> idx) & 1, n[idx])
      end