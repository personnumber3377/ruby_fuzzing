dows-31J', s("%c") % 0xc2)
    #assert_raise(ArgumentError) { s("%c") % 0xc2a1 }
    assert_strenc("\u{c2a1}", 'UTF-8', u("%c") % 0xc2a1)
    assert_strenc("\u{c2}", 'UTF-8', u("%c") % 0xc2)
    assert_raise(Encoding::CompatibilityError) {
      "%s%s" % [s("\xc2\xa1"), e("\xc2\xa1")]
    }

    assert_equal("\u3042".encode('Windows-31J'), "%c" % "\u3042\u3044".encode('Windows-31J'))
  end