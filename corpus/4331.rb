do
        m = Mutex.new
        Fiber.new do
          GC.start
          m.lock
        end