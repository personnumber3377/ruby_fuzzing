do |w|
           w << "a\n\n\nc".gsub(/\n/, "\r\n")
           w.close
         end