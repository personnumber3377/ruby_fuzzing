do |f|
      line = f.readline sep, str.bytesize
      assert_equal(str, line)
    end