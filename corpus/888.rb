do
      bug11873.instance_eval do
        p p{p(p);p p}, tap do
          raise SyntaxError, "should not be passed to tap"
        end