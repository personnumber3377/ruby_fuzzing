do |r|
           err = assert_raise(Encoding::InvalidByteSequenceError) { r.gets }
           assert_equal(invalid.force_encoding("ascii-8bit"), err.error_bytes)
           assert_equal(after.encode("euc-jp"), r.gets)
         end