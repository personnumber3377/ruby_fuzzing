do |*args|
      if orig_thread == Thread.current
        if cont
          @memo += 1
          c = cont
          cont = nil
          begin
            c.call(nil)
          rescue RuntimeError
            set_trace_func(nil)
          end