do
      s = run_in_child("exit 1")
      assert_equal("#<Process::Status: pid #{ s.pid } exit #{ s.exitstatus }>", s.inspect)

      assert_equal(s, s)
      assert_equal(s, s.to_i)

      assert_equal(false, s.stopped?)
      assert_equal(nil, s.stopsig)

      assert_equal(s, Marshal.load(Marshal.dump(s)))
    end