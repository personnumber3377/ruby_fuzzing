do |str, sep, *expected|
      assert_equal(expected, str.split(sep, -1))
    end