do |r|
           result = r.gets(nil)
           assert_equal("\u{3042}".encode("euc-jp"), result)
         end