do |r|
      assert_raise(ArgumentError) { r.readpartial(-1) }
      assert_equal("fooba", r.readpartial(5))
      r.readpartial(5, s = "")
      assert_equal("rbaz", s)
    end