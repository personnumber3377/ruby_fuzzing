do |r|
           assert_equal("\xa4\xa2\xa4\xa4".force_encoding("ascii-8bit"),
                        r.read.force_encoding("ascii-8bit"))
         end