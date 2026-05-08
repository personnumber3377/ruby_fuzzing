do
      pid = fork do
        r.close
        begin
          exec "/path/to/non/existent/#$$/#{rand}.ex"
        rescue SystemCallError
          w.syswrite("exec failed\n")
        end