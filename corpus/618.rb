do |f|
      s = f.to_s
      assert_equal(f, s.to_f, bug3273)
      assert_not_equal(f, s.chop.to_f, bug3273)
    end