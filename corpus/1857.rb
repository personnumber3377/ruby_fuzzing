do
        loop do
          throw :foo, true
          break
        end