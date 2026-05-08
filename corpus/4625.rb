do |r|
      assert_raise(ArgumentError) { r.read(-1) }
      assert_equal("fooba", r.read(5))
      r.read(nil, s = "")
      assert_equal("rbaz", s)
    end