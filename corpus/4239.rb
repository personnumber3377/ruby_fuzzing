do |i|
      GC.stat_heap(nil, stat_heap_all)
      GC.stat_heap(i, stat_heap)

      # Remove keys that can vary between invocations
      %i(total_allocated_objects heap_live_slots heap_free_slots).each do |sym|
        stat_heap[sym] = stat_heap_all[i][sym] = 0
      end