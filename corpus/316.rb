do |tp|
      next unless target_thread?
      events << [tp.event, tp.method_id]
    end