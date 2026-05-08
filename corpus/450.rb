do |unit, num|
      unless num
        assert_raise(ArgumentError){ Process.clock_gettime(Process::CLOCK_REALTIME, unit) }
        next
      end