do |i|
      threads[i] = Thread.new do
        mutex.synchronize do
          result << "C1"
          condvar.wait mutex
          result << "C2"
        end