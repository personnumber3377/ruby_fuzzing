do
      until (ObjectSpace._id2ref(tp_id) rescue nil).nil?
        GC.start
        gc_times += 1
        if gc_times == gc_max_retries
          break
        end