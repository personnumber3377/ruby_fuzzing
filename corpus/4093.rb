do |f|
        assert_equal("a\n", f.gets)      # text
        assert_equal("b\r\n", f.read(3)) # binary
        assert_equal("c\r\n", f.read(3)) # binary
        assert_equal("\n\n", f.read)     # text
      end