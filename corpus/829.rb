doc
    bug7559 = '[ruby-dev:46737]'
    expected, _, actual = __LINE__, <<eom, __LINE__
    a
    b
    c
    d
eom
    assert_equal(expected, actual, bug7559)
  end