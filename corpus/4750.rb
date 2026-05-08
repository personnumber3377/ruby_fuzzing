do |f|
      fd = f.fcntl(Fcntl::F_DUPFD, 63)
      begin
        assert_operator(fd, :>=, 63)
      ensure
        IO.for_fd(fd).close
      end