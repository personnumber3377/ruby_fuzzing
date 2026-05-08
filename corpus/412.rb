do
      File.write("foo", "Process.kill(:KILL, $$); exit(42)")
      system(RUBY, "foo")
      s = $?
      assert_equal(expected,
                   [s.exited?, s.signaled?, s.stopped?, s.success?],
                   "[s.exited?, s.signaled?, s.stopped?, s.success?]")

      assert_equal(s, Marshal.load(Marshal.dump(s)))
    end