do
      eval <<-END, nil, __FILE__, __LINE__+1
        o.foo 1 do|; a| a = 42 end