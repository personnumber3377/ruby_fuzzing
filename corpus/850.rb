dot
    assert_valid_syntax("a\n.foo")
    assert_valid_syntax("a\n&.foo")
    assert_valid_syntax("a #\n#\n.foo\n")
    assert_valid_syntax("a #\n#\n&.foo\n")
  end