do
      Marshal.dump(c)
      GC.start
      1000.times {"x"*1000}
      GC.start
      c.cc.call
    end