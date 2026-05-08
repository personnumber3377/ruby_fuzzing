do |r|
           r2 = r.dup
           begin
             assert_equal("\xA4\xA2".force_encoding("euc-jp"), r2.read)
           ensure
             r2.close
           end