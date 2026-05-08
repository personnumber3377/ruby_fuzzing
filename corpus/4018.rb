do |r|
             s = r.read
             assert_equal(Encoding::UTF_8, s.encoding)
             assert_equal(s.encode("UTF-8"), s)
           end