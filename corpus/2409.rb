do |r, e|
      assert_equal("\"\u3042\"", r.join.force_encoding(Encoding::UTF_8))
      assert_equal([], e)
    end