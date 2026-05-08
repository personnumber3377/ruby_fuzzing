do
      th = Thread.current
      eval <<-EOF.gsub(/^.*?: /, ""), nil, name
       1: th.set_trace_func(prc)
       2: th.add_trace_func(prc2)
       3: class ThreadTraceInnerClass
       4:   def foo
       5:     _x = 1 + 1
       6:   end