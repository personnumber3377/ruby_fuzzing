do
        begin
          u = IO.popen([RUBY, "-e", "print Process.uid", uid: user||uid], &:read)
          assert_equal(uid.to_s, u, feature6975)
        rescue Errno::EPERM, Errno::EACCES, NotImplementedError
        end