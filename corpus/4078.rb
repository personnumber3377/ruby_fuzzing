do |w|
           w << "a\n\n\ncdefgh".gsub(/\n/, "\r\n")
           w.close
         end