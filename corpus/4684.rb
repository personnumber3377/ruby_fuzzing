do |f|
      assert_equal(true, f.close_on_exec?)
      f.close_on_exec = false
      assert_equal(false, f.close_on_exec?)
      f.close_on_exec = true
      assert_equal(true, f.close_on_exec?)
      f.close_on_exec = false
      assert_equal(false, f.close_on_exec?)
    end