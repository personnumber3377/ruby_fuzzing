do
      eval <<-END, nil, __FILE__, __LINE__+1
        def m
          if x = true
            1
          else
            2
          end