do
      e = Marshal.load(dump)
      assert_same(e, e.cause)
    end