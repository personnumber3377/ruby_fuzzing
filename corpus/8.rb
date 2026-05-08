do
      begin
        woken = condvar.wait(mutex, timeout)
      ensure
        locked = mutex.locked?
      end