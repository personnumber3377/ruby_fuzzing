do |r|
      assert_equal("0123456789\n0", r.gets(nil, 12))
      assert_raise(TypeError) { r.gets(3,nil) }
    end