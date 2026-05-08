dows?
        # passing non-stdio fds is not supported on Windows
        assert_raise(Errno::ENOENT) {
          Process.wait Process.spawn("non-existing-command", (3..60).to_a=>["err", File::WRONLY|File::CREAT])
        }
        assert_equal("", File.read("err"))
      end