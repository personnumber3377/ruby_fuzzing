dows-31J",  Regexp.quote(s("\xc2\xa1")).encoding)
    assert_encoding("UTF-8",      Regexp.quote(u("\xc2\xa1")).encoding)
  end