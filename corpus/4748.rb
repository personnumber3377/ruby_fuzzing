do |f|
      r, w = IO.pipe
      pid = fork do
        r.close
        lock = [Fcntl::F_WRLCK, IO::SEEK_SET, pad, 12, 34, 0].pack("s!s!i!L!L!i!")
        f.fcntl Fcntl::F_SETLKW, lock
        w.syswrite "."
        sleep
      end