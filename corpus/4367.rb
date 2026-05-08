dows-31J string}) {
      assert_equal(nil, r =~ s("\xc2\xa1"))
    }
    assert_warning(%r{historical binary regexp match /\.\.\./n against UTF-8 string}) {
      assert_equal(nil, r =~ u("\xc2\xa1"))
    }

    assert_nothing_raised { eval(e("/\\x80/n")) }
  end