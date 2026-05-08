do |tp|
      results << tp.event
      GC.verify_compaction_references
    end