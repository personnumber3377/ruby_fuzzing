do |h|
      assert_not_equal(h.hash, h.invert.hash, feature4262)
    end