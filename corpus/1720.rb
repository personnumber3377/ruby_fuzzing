do |f|
          assert_raise(Timeout::Error) do
            Timeout.timeout(timeout) do
              f.flock(File::LOCK_EX)
            end