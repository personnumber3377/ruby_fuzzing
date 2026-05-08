do |r|
           r2 = r.dup
           begin
             assert_equal("?", r2.read)
           ensure
             r2.close
           end