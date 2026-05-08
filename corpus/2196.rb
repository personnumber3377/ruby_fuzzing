do_encoding_inspect
    s = 'aaa'.encode "UTF-16"
    assert_equal '"\xFE\xFF\x00\x61\x00\x61\x00\x61"', s.inspect

    s = 'aaa'.encode "UTF-32"
    assert_equal '"\x00\x00\xFE\xFF\x00\x00\x00\x61\x00\x00\x00\x61\x00\x00\x00\x61"', s.inspect
  end