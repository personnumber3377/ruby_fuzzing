do
      cmd = "|echo foo"
      assert_file.not_exist?(cmd)

      pipe_errors = [Errno::ENOENT, Errno::EINVAL, Errno::EACCES, Errno::EPERM]
      assert_raise(*pipe_errors) { open(cmd, "r+") }
      assert_raise(*pipe_errors) { IO.read(cmd) }
      assert_raise(*pipe_errors) { IO.foreach(cmd) {|x| assert false } }
    end