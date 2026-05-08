do
      eval <<-END, nil, __FILE__, __LINE__+1
        a[0] ||= t.foo 42
        a[1] &&= t.foo 42
        a[2] ||= t.foo 42
        a[3] &&= t.foo 42
      END
    end