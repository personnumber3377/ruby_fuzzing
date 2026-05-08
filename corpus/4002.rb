do |r|
           err = assert_raise(Encoding::InvalidByteSequenceError) { r.getc }
           assert_equal("\xA1".force_encoding("ascii-8bit"), err.error_bytes)
           assert_equal("xyz", r.read(10))
         end