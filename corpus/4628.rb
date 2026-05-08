do |r|
      r.read(nil, s = "01234567")
      assert_equal("foob", s)
    end