do
      eval <<-END, nil, __FILE__, __LINE__+1
        c::foo, c::bar = 1, 2
        c.Foo, c.Bar = 1, 2
        c::FOO, c::BAR = 1, 2
      END
    end