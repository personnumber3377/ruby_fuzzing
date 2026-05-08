do |r|
           assert_equal("\xa4\xa2".force_encoding("euc-jp"), r.getc)
           r.set_encoding(Encoding::Shift_JIS)
           assert_equal("\x82\xa0".force_encoding(Encoding::Shift_JIS), r.getc)
         end