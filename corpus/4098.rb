do |f|
        assert_equal("a\n", f.gets)      # text
        assert_equal("b\r\n", f.read(3)) # binary
      end