do |enc|
      next unless enc.ascii_compatible?
      s = "abc".force_encoding(enc)
      assert_equal("", s[3, 1], bug5836)
    end