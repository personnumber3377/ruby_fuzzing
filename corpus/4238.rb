do |i|
      EnvUtil.without_gc do
        GC.stat_heap(i, stat_heap)
        GC.stat(stat)
      end