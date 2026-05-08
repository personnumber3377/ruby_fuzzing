does not.
    ary = [1, -100, 127, 128, 32767, 987.654321098/100.0,
      12345, 123456, -32767, -123456, "abcdef"]
    x    = ary.pack(format)
    ary2 = x.unpack(format)

    assert_equal(ary.length, ary2.length)
    assert_equal(ary.join(':'), ary2.join(':'))
    assert_not_nil(x =~ /def/)

    # more comprehensive tests are in test_pack.rb
  end