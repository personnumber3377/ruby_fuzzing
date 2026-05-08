doesn't export FD_SETSIZE. then we assume it's 1024.
      fd_setsize = 1024

      # try to raise RLIM_NOFILE to >FD_SETSIZE
      begin
        Process.setrlimit(Process::RLIMIT_NOFILE, fd_setsize+20)
      rescue Errno::EPERM
        exit 0
      end