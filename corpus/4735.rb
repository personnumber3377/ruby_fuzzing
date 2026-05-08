do
        500.times {
          f = File.open(path, "w")
          f.instance_variable_set(:@test_flush_in_finalizer1, true)
          fds << f.fileno
          f.print "hoge"
        }
      end