do
      Timeout.timeout(0.1) { condvar.wait mutex }
    end