do
      t1 = Thread.new do
        Process.waitpid long_pid
      end