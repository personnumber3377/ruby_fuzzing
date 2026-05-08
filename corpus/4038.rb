do |r|
           assert_equal("\xa4\xa2".force_encoding("euc-jp"), r.getc)
           r.set_encoding(nil)
           assert_equal("\x82\xa0".force_encoding(Encoding.default_external), r.read)
         end