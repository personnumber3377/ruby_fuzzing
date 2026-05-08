do
      eval <<-END, nil, __FILE__, __LINE__+1
        def o.foo(a=42,z,&b); b.call(a*1000+z*100); end