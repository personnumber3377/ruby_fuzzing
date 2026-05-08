do |i|
      str = sprintf("%*s".b, i, "\xe2".b)
      refute_predicate str, :ascii_only?
      assert_equal i, str.bytesize
    end