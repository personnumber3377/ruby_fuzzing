do |w|
           s = "\u3042".force_encoding("ascii-8bit")
           s << "\x82\xa0".force_encoding("ascii-8bit")
           w << s
           w.close
         end