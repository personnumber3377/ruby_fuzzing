do
      pid = fork do
        r.close
        begin
          trap(:USR1) { w.syswrite("USR1\n"); exit 0 }
          exec "/path/to/non/existent/#$$/#{rand}.ex"
        rescue SystemCallError
          w.syswrite("exec failed\n")
        end