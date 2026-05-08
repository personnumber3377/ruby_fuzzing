do
        open("tmp", "rt") {|f|
          s = f.getc
          assert_equal(true, s.valid_encoding?)
          assert_equal("\u3042", s)
        }
      end