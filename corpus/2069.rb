do
      cmd = [ EnvUtil.rubybin, '--disable=gems' '-e', 'sleep 10' ]
      pid = Process.spawn(*cmd, :pgroup => true)
      Process.kill(:"-TERM", pid)
      Process.waitpid(pid)
      assert_equal(true, $?.signaled?)
      assert_equal(Signal.list["TERM"], $?.termsig)
    end