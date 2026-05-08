do
      t1 = Process.clock_gettime(Process::CLOCK_REALTIME)
      yield
      t2 = Process.clock_gettime(Process::CLOCK_REALTIME)
      log << (t2 - t1)
      return (t1 + t2) / 2 if t2 - t1 < 1
      sleep 1
    end