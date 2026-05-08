do |io|
        Signal.trap(:#{sig}, "EXIT")
        STDOUT.syswrite("a")
        Thread.start { sleep(2) }
        STDIN.sysread(4096)
      End
      pid = io.pid
      io.sysread(1)
      sleep 0.1
      assert_nothing_raised("[ruby-dev:26128]") {
        Process.kill(term, pid)
        begin
          Timeout.timeout(3) {
            Process.waitpid pid
          }
        rescue Timeout::Error
          if term
            Process.kill(term, pid)
            term = (:KILL if term != :KILL)
            retry
          end