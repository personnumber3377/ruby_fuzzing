do
      assert_equal(sym, eval(':"foo\u0000bar"'))
    end