do
      eval <<-END, nil, __FILE__, __LINE__+1
        (x, y = 1, 2) ? 1 : 2
      END
    end