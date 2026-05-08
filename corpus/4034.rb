do |r|
           assert_equal("\xa4\xa2".force_encoding("euc-jp"), r.getc)
           r.set_encoding("shift_jis:euc-jp")
           assert_equal("\xa4\xa2".force_encoding("euc-jp"), r.getc)
         end