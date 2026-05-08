do |f|
        f.write("0123456789")
        f.rewind

        assert_equal(4, f.readline(4).bytesize)
        assert_equal(4, f.readline(3).bytesize)
      end