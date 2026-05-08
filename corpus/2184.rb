do
      wmap = ObjectSpace::WeakMap.new

      (GC::INTERNAL_CONSTANTS[:RVALUE_OLD_AGE] - 1).times { GC.start }

      retain = []
      50.times do
        k = Object.new
        wmap[k] = true
        retain << k
      end