do
      eval <<-END, nil, __FILE__, __LINE__+1
        def t.`(x); "foo" + x + "bar"; end