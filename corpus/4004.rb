do
        open("tmp", "rt") {|f|
          s = f.getc
          assert_equal(false, s.valid_encoding?)
          assert_equal("\xE3".force_encoding("UTF-8"), s)
          s = f.getc
          assert_equal(false, s.valid_encoding?)
          assert_equal("\x81".force_encoding("UTF-8"), s)
        }
      end