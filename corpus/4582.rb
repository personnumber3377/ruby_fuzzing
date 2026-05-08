do |w|
        ret = IO.copy_stream(src, w, 1, 1)
        assert_equal(1, ret)
        w.close
      end