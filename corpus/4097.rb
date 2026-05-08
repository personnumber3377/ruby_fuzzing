do |f|
        assert_equal("a\r\n", f.read(3))  # binary
        f.write("b\n\n");                 # text
        f.rewind
        assert_equal("a\nb\n\n", f.read)  # text
        f.rewind
        assert_equal("a\r\nb\r\n\r\n", f.binmode.read) # binary
      end