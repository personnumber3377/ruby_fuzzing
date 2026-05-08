dows_version < 6
        1.upto(12) {|i|
          assert_raise(Errno::EINVAL) { ENV[key] = val }
        }
      else
        1.upto(12) {|i|
          assert_nothing_raised(Errno::EINVAL) { ENV[key] = val }
        }
      end