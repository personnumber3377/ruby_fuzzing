do |*args|
      if cont
        @memo += 1
        c = cont
        cont = nil
        begin
          c.call(nil)
        rescue RuntimeError
          Thread.current.set_trace_func(nil)
        end