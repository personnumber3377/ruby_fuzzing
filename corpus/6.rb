do
        mutex.synchronize do
          condvar.wait mutex
        end