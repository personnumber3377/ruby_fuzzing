do
      eval <<-END, nil, __FILE__, __LINE__+1
        def o.foo(a=42,*r,z,&b); b.call(r.inject(a*1000+z*100, :+)); end