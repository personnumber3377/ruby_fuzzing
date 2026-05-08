do |f|
      f.ungetc(%Q[\u{3042}\u{3044}\u{3046}])
      assert_equal [0x3042, 0x3044, 0x3046], f.each_codepoint.to_a
    end