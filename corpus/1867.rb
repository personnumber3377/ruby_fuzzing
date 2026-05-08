do
      e.set_backtrace(["foo"] + caller_locations(1, 1))
    end