downcase
      assert_predicate(t, :valid_encoding?)
      assert_equal(t.encoding, s.encoding)
      assert_operator(t, :casecmp, s)
      t2 = s.dup
      t2.downcase!
      assert_equal(t, t2)
    }
  end