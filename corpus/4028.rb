do |r|
           assert_equal(before1.encode("euc-jp"), r.getc)
           assert_equal(before2.encode("euc-jp"), r.getc)
           err = assert_raise(Encoding::InvalidByteSequenceError) { r.getc }
           assert_equal(invalid.force_encoding("ascii-8bit"), err.error_bytes)
           assert_equal(after1.encode("euc-jp"), r.getc)
           assert_equal(after2.encode("euc-jp"), r.getc)
         end