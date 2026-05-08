do |r|
           assert_equal("a\n\n", r.gets(""))
           assert_equal("c", r.getc)
           assert_equal("defgh", r.readpartial(10))
         end