do |r|
           Timeout.timeout(1) {
             assert_equal("before \xa2\xa2".encode("utf-8", "euc-jp"),
                          r.gets(rs))
           }
         end