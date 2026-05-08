does not
    s = "foo\n"
    assert_equal("foo", s.delete_suffix!("\n"))
    s = "foo\r\n"
    assert_equal("foo\r", s.delete_suffix!("\n"))
    s = "foo\r"
    assert_equal(nil, s.delete_suffix!("\n"))
  end