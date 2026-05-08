do |n|
      pipe(proc do |w|
        w.write(*(["a"] * n))
        w.close
      end