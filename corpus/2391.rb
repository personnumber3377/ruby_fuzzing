do |r, e|
      assert_operator(r.size, :<=, TRADITIONAL_TERM_ROWS)
      longer = r[1..-1].select {|x| x.size >= TRADITIONAL_TERM_COLS}
      assert_equal([], longer)
      assert_equal([], e)
    end