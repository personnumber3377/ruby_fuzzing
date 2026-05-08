dog )]
    i = 0
    a.each_index { |ind|
      assert_equal(i, ind)
      i += 1
    }
    assert_equal(4, i)

    a = @cls[]
    i = 0
    a.each_index { |ind|
      assert(false, "Never get here")
      i += 1
    }
    assert_equal(0, i)

    assert_equal(a, a.each_index {})
  end