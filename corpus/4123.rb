do |idx|
        s = @it.hex(idx)
        assert_equal(idx * 2, s.size)
        assert_match(/\A\h*\z/, s)
      end