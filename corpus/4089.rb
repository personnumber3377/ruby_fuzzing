do |r, w|
      src = "a\r\nb\r\nc\r\n"
      w.binmode.write src
      w.close

      assert_equal("a", r.getc)
      assert_equal("\n", r.getc)
      r.binmode
      assert_equal("b", r.getc)
      assert_equal("\r", r.getc)
      assert_equal("\n", r.getc)
      assert_equal("c", r.getc)
      assert_equal("\r", r.getc)
      assert_equal("\n", r.getc)
      assert_equal(nil, r.getc)
      r.close
    end