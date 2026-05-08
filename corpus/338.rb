do |tp|
      next unless tp.path == __FILE__
      events << Thread.current
    end