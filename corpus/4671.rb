do |r|
      e = nil
      assert_warn('') {
        e = r.each_line
      }
      assert_equal("foo\n", e.next)
      assert_equal("bar\n", e.next)
      assert_equal("baz\n", e.next)
      assert_raise(StopIteration) { e.next }
    end