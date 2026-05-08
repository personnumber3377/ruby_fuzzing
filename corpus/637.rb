do
      assert_equal(Rational(1, 2), Marshal.load(dump), bug6625)
    end