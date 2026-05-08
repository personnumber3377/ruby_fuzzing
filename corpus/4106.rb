do |f|
      f.ungetc(%Q[\u{3042}\u{3044}\u{3046}])
      assert_raise(ArgumentError) do
        f.each_codepoint.to_a
      end