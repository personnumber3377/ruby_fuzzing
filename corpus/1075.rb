do
      Fiber.new do
        pid = fork do
          xpid = nil
          Fiber.new {
            xpid = fork do
              # enough to trigger GC on old root fiber
              count = 1000
              count.times do
                Fiber.new {}.transfer
                Fiber.new { Fiber.yield }
              end