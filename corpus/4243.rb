do
      # allocate objects until need_major_by is set or major GC happens
      objects = []
      while GC.latest_gc_info(:need_major_by).nil?
        objects.append