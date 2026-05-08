dows delays updating atime
        assert_in_delta atime, stat.atime.to_f, delta
      end