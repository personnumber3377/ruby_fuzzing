do
      s = assert_in_out_err([], "Signal.trap(:QUIT,'DEFAULT'); Process.kill(:SIGQUIT, $$);sleep 30", //, //, rlimit_core: 0)
      assert_equal([false, true, false, nil],
                   [s.exited?, s.signaled?, s.stopped?, s.success?],
                   "[s.exited?, s.signaled?, s.stopped?, s.success?]")
      assert_equal("#<Process::Status: pid #{ s.pid } SIGQUIT (signal #{ s.termsig })>",
                   s.inspect.sub(/ \(core dumped\)(?=>\z)/, ''))

      assert_equal(s, Marshal.load(Marshal.dump(s)))
    end