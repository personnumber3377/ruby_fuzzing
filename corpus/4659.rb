do |f|
      line = f.readline str.bytesize
      assert_equal(str, line)
    end