do |w|
        ret = IO.copy_stream(src, w)
        assert_equal(content.bytesize, ret)
        w.close
      end