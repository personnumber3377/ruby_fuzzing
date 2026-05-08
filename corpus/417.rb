do
      File.write("foo", "sleep 0.1")
      ps = (0...3).map { spawn(RUBY, "foo") }.sort
      ss = Process.waitall.sort
      ps.zip(ss) do |p1, (p2, s)|
        assert_equal(p1, p2)
        assert_equal(p1, s.pid)
      end