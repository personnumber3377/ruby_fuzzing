do |r|
           r.binmode
           assert_equal("\x00\x00\x01\x0a\n", r.read(5), bug)
           assert_equal("\x01\x0a\n", r.read(3), bug)
           assert_equal("\x01\x0a\x00\x00\n", r.read(5), bug)
           assert_equal("\x01\x0a\n", r.read(3), bug)
           assert_equal("", r.read, bug)
           r.close
         end