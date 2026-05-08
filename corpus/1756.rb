do |i|
      assert_equal(0, i.pow(0, 1), '[Bug #17257]')
      assert_equal(1, i.pow(0, 2))
      assert_equal(1, i.pow(0, 3))
      assert_equal(1, i.pow(0, 6))
      assert_equal(1, i.pow(0, 1234567890123456789))

      assert_equal(0,  i.pow(0, -1))
      assert_equal(-1, i.pow(0, -2))
      assert_equal(-2, i.pow(0, -3))
      assert_equal(-5, i.pow(0, -6))
      assert_equal(-1234567890123456788, i.pow(0, -1234567890123456789))
    end