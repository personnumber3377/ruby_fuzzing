do
      eval <<-END, nil, __FILE__, __LINE__+1
        o.foo ||= 42
        o.bar &&= 42
        o.Foo ||= 42
        o.Bar &&= 42
        o::baz ||= 42
        o::qux &&= 42
      END
    end