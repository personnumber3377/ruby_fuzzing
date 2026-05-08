do
      thrs = nr.times.map { Thread.new { m.synchronize {} } }
      thrs.each { Thread.pass }
      pid = fork do
        m.locked? or exit!(2)
        thrs = nr.times.map { Thread.new { m.synchronize {} } }
        m.unlock
        thrs.each { |t| t.join(1) == t or exit!(1) }
        exit!(0)
      end