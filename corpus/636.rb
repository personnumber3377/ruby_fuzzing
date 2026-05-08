do |i, a|
      s = proc {i.inspect}
      assert_equal(a[0], i.floor, s)
      assert_equal(a[1], i.ceil, s)
      assert_equal(a[2], i.truncate, s)
      assert_equal(a[3], i.round, s)
      assert_equal(a[4], i.round(half: :even), s)
      assert_equal(a[5], i.round(half: :up), s)
      assert_equal(a[6], i.round(half: :down), s)
    end