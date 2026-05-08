do
      Thread.new { mutex.synchronize { condvar.wait(mutex) } }
    end