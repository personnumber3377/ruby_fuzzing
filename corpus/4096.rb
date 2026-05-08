do |f|
        assert_equal("a", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("b\r\n", f.read(3))  # binary
        assert_equal("c", f.getc)         # text
        assert_equal("\n", f.getc)        # text
        assert_equal("\n", f.getc)        # text
      end