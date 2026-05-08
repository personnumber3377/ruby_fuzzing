do
      eval <<-END, nil, __FILE__, __LINE__+1
        (true..false) ? 1 : 2
      END
    end