do
      assert_equal(sym, eval(':"foo\u{0}bar"'))
    end