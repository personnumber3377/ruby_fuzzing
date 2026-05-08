do |r, w|
      assert_equal(true, r.close_on_exec?)
      r.close_on_exec = false
      assert_equal(false, r.close_on_exec?)
      r.close_on_exec = true
      assert_equal(true, r.close_on_exec?)
      r.close_on_exec = false
      assert_equal(false, r.close_on_exec?)

      assert_equal(true, w.close_on_exec?)
      w.close_on_exec = false
      assert_equal(false, w.close_on_exec?)
      w.close_on_exec = true
      assert_equal(true, w.close_on_exec?)
      w.close_on_exec = false
      assert_equal(false, w.close_on_exec?)
    end