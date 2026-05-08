do
      th = Thread.new do
        mutex.synchronize { condvar.wait(mutex) }
        :ok
      end