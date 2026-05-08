do |r|
      r.readline; assert_equal(1, $.)
      r.readline; assert_equal(2, $.)
      r.lineno = 1000; assert_equal(2, $.)
      r.readline; assert_equal(1001, $.)
      assert_raise(EOFError) { r.readline }
    end