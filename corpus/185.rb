do
      eval <<-END, nil, __FILE__, __LINE__+1
        def o.foo(*r,z,&b); b.call(r.inject(z*100, :+)); end