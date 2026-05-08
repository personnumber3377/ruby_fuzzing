do |i|
      pipe(proc do |w|
        w.write("a" * ((4096 << i) - 4), "\r\n" "a\r\n")
        w.close
      end