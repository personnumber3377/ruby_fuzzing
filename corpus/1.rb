do
      Thread.current.abort_on_exception = false
      mutex.synchronize do
        assert_raise(Interrupt) {
          condvar.wait(mutex)
        }
        locked = mutex.locked?
      end