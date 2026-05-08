do
        p = p.dup
        GC.start
        p.call
      rescue ArgumentError
      end