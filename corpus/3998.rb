do |r|
           assert_equal("\xa1\xa1".encode("utf-8", "euc-jp"), r.getc)
         end