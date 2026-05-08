do |r|
           assert_equal("\e$B$\"$$\e(B".force_encoding("ascii-8bit"),
                        r.read.force_encoding("ascii-8bit"))
         end