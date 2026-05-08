do |i|
      GC.compact
      @wm[i] = obj
    end