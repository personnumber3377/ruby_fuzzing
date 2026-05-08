do
      eval <<-END, nil, __FILE__, __LINE__+1
        y = 1

        1.times do
          if y = true
            1
          else
            2
          end