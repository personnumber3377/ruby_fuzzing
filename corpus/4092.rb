do |f|
        # read with length should be binary mode
        assert_equal("a\r\n", f.read(3)) # binary
        assert_equal("b\nc\n\n", f.read) # text
      end