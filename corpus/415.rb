do
      File.write("foo", "sleep 0.1")
      pid = spawn(RUBY, "foo")
      assert_equal(pid, Process.wait)
    end