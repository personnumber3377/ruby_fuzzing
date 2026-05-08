do |f|
          assert_equal(0, $.)
          f.gets; assert_equal(1, $.)
          f.gets; assert_equal(2, $.)
          f.lineno = 1000; assert_equal(2, $.)
          f.gets; assert_equal(1001, $.)
          f.gets; assert_equal(1001, $.)
          f.rewind; assert_equal(1001, $.)
          f.gets; assert_equal(1, $.)
          f.gets; assert_equal(2, $.)
          f.gets; assert_equal(3, $.)
          f.gets; assert_equal(3, $.)
        end