do |r, w|
      r.timeout = 0.1
      r2 = r.dup
      assert_equal(0.1, r2.timeout)
    ensure
      r2&.close
    end