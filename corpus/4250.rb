do |i|
        capa = (GC.stat_heap(i, :slot_size) - GC::INTERNAL_CONSTANTS[:RVALUE_OVERHEAD] - (2 * RbConfig::SIZEOF["void*"])) / RbConfig::SIZEOF["void*"]
        while GC.stat_heap(i, :heap_eden_slots) < GC_HEAP_INIT_SLOTS
          Array.new(capa)
        end