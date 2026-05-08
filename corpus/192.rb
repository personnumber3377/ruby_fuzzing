do
      assert_equal(sym, eval(":'foo\0bar'"))
    end