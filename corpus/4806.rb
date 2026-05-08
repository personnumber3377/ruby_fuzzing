dout_to_closed_pipe
    EnvUtil.invoke_ruby(["-e", "loop {puts :ok}"], "", true, true) do
      |in_p, out_p, err_p, pid|
      out = out_p.gets
      out_p.close
      err = err_p.read
    ensure
      status = Process.wait2(pid)[1]
      assert_equal("ok\n", out)
      assert_empty(err)
      assert_not_predicate(status, :success?)
      if Signal.list["PIPE"]
        assert_predicate(status, :signaled?)
        assert_equal("PIPE", Signal.signame(status.termsig) || status.termsig)
      end