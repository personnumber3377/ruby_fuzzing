does_something
      before = GC.auto_compact
      list = []
      list2 = []

      # Try to make some fragmentation
      500.times {
        list << Object.new
        Object.new
        Object.new
      }
      count = GC.stat :compact_count
      GC.auto_compact = true
      n = 1_000_000
      n.times do
        break if count < GC.stat(:compact_count)
        list2 << Object.new
      end