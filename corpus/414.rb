do |io|
      pid = io.pid
      assert_nil(Process::Status.wait(pid, Process::WNOHANG))
      io.puts
      ret = Process::Status.wait(pid)
      assert_instance_of(Process::Status, ret)
      assert_equal(pid, ret.pid)
      assert_predicate(ret, :exited?)
    end