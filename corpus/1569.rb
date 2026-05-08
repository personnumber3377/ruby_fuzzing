dog )]
    i = 0
    a.each { |e|
      assert_equal(a[i], e)
      i += 1
    }
    assert_equal(4, i)

    a = @cls[]
    i = 0
    a.each { |e|
      assert(false, "Never get here")
      i += 1
    }
    assert_equal(0, i)

    assert_equal(a, a.each {})
  end