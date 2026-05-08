do |dst|
        ret = IO.copy_stream(src, dst)
        assert_equal(content.bytesize, ret)
        assert_equal(content, File.read("dst"))
      end