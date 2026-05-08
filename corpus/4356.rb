dows-31J UTF-8].each {|ename|
      # "\xc2\xa1" is a valid sequence for ASCII-8BIT, EUC-JP, Windows-31J and UTF-8.
      assert_nothing_raised { r =~ "\xc2\xa1".force_encoding(ename) }
    }
  end