downcase
    assert_equal("aBc", s)
    s.downcase!
    assert_equal("abc", s)

    s = "aBc"
    s.swapcase
    assert_equal("aBc", s)
    s.swapcase!
    assert_equal("AbC", s)

    s = "aBc"
    s.capitalize
    assert_equal("aBc", s)
    s.capitalize!
    assert_equal("Abc", s)

    s = "aBc"
    s.tr("a-z", "A-Z")
    assert_equal("aBc", s)
    s.tr!("a-z", "A-Z")
    assert_equal("ABC", s)

    s = "aaBBcc"
    s.tr_s("a-z", "A-Z")
    assert_equal("aaBBcc", s)
    s.tr_s!("a-z", "A-Z")
    assert_equal("ABBC", s)

    s = "aaBBcc"
    s.squeeze("a-z")
    assert_equal("aaBBcc", s)
    s.squeeze!("a-z")
    assert_equal("aBBc", s)

    s = "aaBBcc"
    s.delete("a-z")
    assert_equal("aaBBcc", s)
    s.delete!("a-z")
    assert_equal("BB", s)
  end