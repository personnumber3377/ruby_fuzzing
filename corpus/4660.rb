do |f|
      line = f.readline(str.bytesize + 5)
      assert_equal(str + sep, line)
    end