do
          *, stat = Process.wait2(pid)
          [stat, err_p.read]
        end