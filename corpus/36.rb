downcase!
    a = S("helLO")
    b = a.dup
    assert_equal(S("hello"), a.downcase!)
    assert_equal(S("hello"), a)
    assert_equal(S("helLO"), b)

    a=S("hello")
    assert_nil(a.downcase!)
    assert_equal(S("hello"), a)

    a = S("h\0""ELLO")
    b = a.dup
    assert_equal(S("h\0""ello"), a.downcase!)
    assert_equal(S("h\0""ello"), a)
    assert_equal(S("h\0""ELLO"), b)
  end