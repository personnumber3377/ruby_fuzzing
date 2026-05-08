do |w|
           Marshal.dump(data, w)
           w.close
         end