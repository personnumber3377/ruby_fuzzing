do
      assert_equal(Complex(1, 2), Marshal.load(dump), bug6625)
    end