do
      eval <<-END, nil, __FILE__, __LINE__+1
        o.foo ||= t.foo 42
        o.bar &&= t.foo 42
        o.Foo ||= t.foo 42
        o.Bar &&= t.foo 42
        o::baz ||= t.foo 42
        o::qux &&= t.foo 42
      END
    end