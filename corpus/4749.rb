do |f|
      r, w = IO.pipe
      pid = fork do
        r.close
        lock = [start, len, 0, Fcntl::F_WRLCK, IO::SEEK_SET, sysid].pack("qqis!s!i!")
        f.fcntl Fcntl::F_SETLKW, lock
        w.syswrite "."
        sleep
      end