do |w|
           w << "a" * 1023 + "\u3042" + "a" * 1022
           w.close
         end