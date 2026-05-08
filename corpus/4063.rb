do |w|
           w.set_encoding("iso-2022-jp:utf-8")
             w << "\u3042"
             w << "\u3044"
             w.close
         end