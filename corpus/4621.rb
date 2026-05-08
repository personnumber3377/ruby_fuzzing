do |r|
      r.readpartial(5, s = "01234567")
      assert_equal("foob", s)
    end