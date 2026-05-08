do
      write_file("test-script", "$0 = 'hello world'; /test-script/ =~ Process.argv0 or $0 = 'Process.argv0 changed!'; sleep 60")

      pid = spawn(EnvUtil.rubybin, "test-script")
      ps = nil
      now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      stop = now + 30
      begin
        sleep 0.1
        ps = `#{PSCMD.join(' ')} #{pid}`
        break if /hello world/ =~ ps
        now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      end