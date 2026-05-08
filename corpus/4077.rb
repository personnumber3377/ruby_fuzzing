do |r|
           assert_equal("a\n\n", r.gets(""))
           assert_equal("c", r.gets(""), "[ruby-core:23723] (18)")
         end