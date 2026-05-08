do |r|
             s = r.getc
             assert_equal(enc, s.encoding)
           end