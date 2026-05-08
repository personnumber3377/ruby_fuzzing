do
      eval <<-END, nil, __FILE__, __LINE__+1
        a &&= t.foo 42
        b &&= t.foo 42
        c &&= t.foo nil
        d &&= t.foo false
      END
    end