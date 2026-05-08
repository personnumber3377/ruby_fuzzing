do
        m = Mutex.new
        Thread.new do
          m.synchronize do
          end