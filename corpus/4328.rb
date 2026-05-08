do
          w = Thread.start { sleep 30 }
          begin
            f.puts
            f.gets
          ensure
            w.kill
            t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
            w.join(30)
            t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
            diff = t1 - t0
            assert_operator diff, :<=, 2
          end