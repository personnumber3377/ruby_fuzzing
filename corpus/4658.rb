do |f|
      line = f.readline(sep, str.bytesize + 5, chomp: true)
      assert_equal(str, line)
    end