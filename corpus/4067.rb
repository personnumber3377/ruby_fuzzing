do |w|
           w.set_encoding("euc-jp")
           w << "\u3042"
           w << "\x82\xa2".force_encoding("sjis")
           w.close
         end