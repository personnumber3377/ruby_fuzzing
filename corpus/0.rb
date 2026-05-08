do
      t = Thread.new do
        mutex.synchronize do
          result << 1
          condvar.signal
        end